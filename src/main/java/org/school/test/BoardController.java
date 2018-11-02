package org.school.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.school.test.dao.BoardDAO;
import org.school.test.util.PageNavigator;
import org.school.test.vo.Board;
import org.school.test.vo.goodHit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class BoardController {
	
	@Autowired
	SqlSession sqlsession;
	private static final String UPLOADPATH="D:\\\\fileRepo\\\\";
	final int countPerPage = 10;
	final int pagePerGroup = 5;
	
	//schoolnum 세션에 넣어주기
	@RequestMapping(value = "/setSchoolnum", method = RequestMethod.GET)
	public String setSchoolnumInSession(String schoolnum, HttpSession httpsession) {
		System.out.println(schoolnum);
		httpsession.setAttribute("schoolnum", schoolnum);
		return "redirect:/getBoardList";
	}
	
	//goodhit 세션에 넣어주기
	@RequestMapping(value = "/hitGood", method = RequestMethod.GET)
	public String hitGoodInSession(String boardnum, HttpSession httpsession) {
		httpsession.setAttribute("goodhitBoardnum", boardnum);
		
			return "redirect:/getHitGood";
	}

	
	//목록으로
	@RequestMapping(value="/getBoardList", method=RequestMethod.GET)
	public String boardList( Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchText", defaultValue="") String searchText, 
			@RequestParam(value="search", defaultValue="title") String search,
			HttpSession httpsession) 

		{

		Map<String, String> map = new HashMap<>();
		map.put("searchText", searchText);
		map.put("search", search);
		map.put("schoolnum", (String) httpsession.getAttribute("schoolnum"));
		
		//페이징처리
		BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
		
		int total=dao.getCount(map);
		
		PageNavigator navi =  new PageNavigator(countPerPage, pagePerGroup, page, total);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		
		//검색한거 가져오기
		List<Board> list=dao.getBoardListMap(map, rb);
		//검색후 페이징 처리..
		System.out.println(list.size());
		model.addAttribute("navi", navi);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("searchText",searchText);
		model.addAttribute("search",search);
	
		return "boardList";
		}
	
	//게시판작성폼
	@RequestMapping(value = "/boardRegistForm", method = RequestMethod.GET)
	public String boardRegistForm(HttpSession session, Model model) {
		if(session.getAttribute("loginId")==null) {
			model.addAttribute("forBoardForm", "forBoardForm");
			return "login";
			}
		else{
			return "boardRegistForm";
			}
	}
	
	//게시판db로 보내기
	@RequestMapping(value="/writeBoard", method=RequestMethod.POST)
	public String bookList(Board board, HttpSession session,
			MultipartFile uploadfile, Model model) {
	
		BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
		board.setUserid((String) session.getAttribute("loginId"));
	
		//파일 서버에 저장하기
		UUID uuid = UUID.randomUUID();
		if(!uploadfile.isEmpty()) {
		String saveFileName=uuid+"_"+uploadfile.getOriginalFilename();
		//오리지널이름+uuid
		File saveFile=new File(UPLOADPATH,saveFileName);
		//파일껍데기 생성
		
		try {
			uploadfile.transferTo(saveFile);
		}  catch (Exception e) {
			
			e.printStackTrace();
		}
		
		board.setOriginalfile(uploadfile.getOriginalFilename());
		board.setSavefile(saveFileName);
		}
		
		dao.insertBoard(board);
		
		return "redirect:/getBoardList";
		}
	
	//게시판 내용 불러오기
		@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
		public void boardUpdate(
				@RequestParam(value="boardnum", defaultValue="") String boardnum,
				Model model, HttpSession session) {
			
			if(session.getAttribute("goodhitBoardnum")!=null) {
				boardnum = (String) session.getAttribute("goodhitBoardnum");
				session.removeAttribute("goodhitBoardnum");
			}
			Board board=getBoard(boardnum);
			//조회수 증가
			int cnt=board.getHitcount();
			cnt++;
			Board b =new Board();
			b.setHitcount(cnt);
			b.setBoardnum(Integer.parseInt(boardnum));
			BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
			dao.hitBoardCount(b);
			model.addAttribute("board", getBoard(boardnum));
			//좋아요 가져오기
			int goodCount=dao.getHitGood(boardnum);
			
			model.addAttribute("goodCount",goodCount);
			/*//리플 가져오기
			List<Review> reviewList=dao.getReviewList(boardnum);
			model.addAttribute("reviewList",reviewList);*/
			}
		
		//첨부파일 다운로드
		@RequestMapping(value = "/download", method = RequestMethod.GET)
		public @ResponseBody String download(HttpServletResponse response, String boardnum) {
			Board board=getBoard(boardnum);
			String OriginalfileName=board.getOriginalfile();
			String fileName=board.getSavefile();
			try {
				response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(OriginalfileName, "UTF-8"));

			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			FileInputStream fis = null;
			ServletOutputStream sos =null;
			
			String fullpath=UPLOADPATH+fileName;
			
			try {
				
				fis=new FileInputStream(fullpath);
				sos=response.getOutputStream();
				
				FileCopyUtils.copy(fis, sos);
				fis.close();
				//서버는 계속 열려있으면 cpu점유율이 올라간다. 
				//그러다가 서버가 죽으면 안되므로 꼭 close 해줄것
				sos.close();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "result";
		}
		
		@RequestMapping(value="/update", method=RequestMethod.GET)
		public String update(Model model,String boardnum) {
			model.addAttribute("board", getBoard(boardnum));
			return "boardUpdate";
			}
		
		@RequestMapping(value="/updateDb", method=RequestMethod.GET)
		public String updatedb(Board board, Model model) {
			BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
			dao.updateBoard(board);
		
			return "redirect:/getBoardList";
			}
		
		@RequestMapping(value="/deleteBoard", method=RequestMethod.GET)
		public String deleteBoard(String boardnum, Model model) {
			BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
			dao.deleteBoard(boardnum);
			
			return "redirect:/getBoardList";
			}
		@RequestMapping(value="/getHitGood", method=RequestMethod.GET)
		public String hitGood(Model model,
				HttpSession session) {
			
			String loginId=(String) session.getAttribute("loginId");
			BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
			String boardnum =(String) session.getAttribute("goodhitBoardnum");
			session.removeAttribute("goodhitBoardnum");
			goodHit g = new goodHit(loginId, Integer.parseInt(boardnum));
			//중복일 경우 경고창
			goodHit goodhit=dao.selectOneGoodHit(g);
			
			if(goodhit==null) {
			//좋아요 insert
	
			dao.insertHitGood(g);
			model.addAttribute("overlap", "false");
			}
			else {
				model.addAttribute("overlap", "true");
			}
	
			//좋아요 select
			int goodCount=dao.getHitGood(boardnum);

			model.addAttribute("goodCount",goodCount);

			model.addAttribute("board", getBoard(boardnum));
			System.out.println(goodCount+ getBoard(boardnum).toString());
			return "boardDetail";
			}
		
		
		//db에서 전체 게시판리스트 가져오는 메소드
		public List<Board> getBoardList(){
			
			BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
			List<Board> list=dao.getBoardList();
			
			return list;
		}
		
		//db에서 boardnum과 일치하는 게시판 가져오는 메소드
		public Board getBoard(String boardnum){
			
			BoardDAO dao=sqlsession.getMapper(BoardDAO.class);
			Board board=dao.getBoard(boardnum);
				
			return board;
			}
		
	
	
}

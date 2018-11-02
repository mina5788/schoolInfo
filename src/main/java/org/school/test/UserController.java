package org.school.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.school.test.dao.UserDAO;
import org.school.test.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Autowired 
	SqlSession sqlsession;;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() {
	
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(User user) {
		
		//select한 birthday이어주기
		user.setBirthday(user.getBirthYear()+"/"+user.getBirthMonth()+"/"+user.getBirthDate());
		UserDAO dao=sqlsession.getMapper(UserDAO.class);
		dao.insertUser(user);
		return "home";
	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public @ResponseBody String checkId(String userid) {
		UserDAO dao=sqlsession.getMapper(UserDAO.class);
		String checkedId=dao.getCheckedId(userid);
		
		return checkedId;
	}
	
	@RequestMapping(value = "/updateUserInfoForm", method = RequestMethod.GET)
	public void updateUserInfo(HttpSession httpsession, Model model) {
		
		String loginId=(String) httpsession.getAttribute("loginId");
		UserDAO dao=sqlsession.getMapper(UserDAO.class);
		User user = dao.getUserInfo(loginId);
		user.setBirthYear(Integer.parseInt(user.getBirthday().substring(0, 4)));
		user.setBirthMonth(Integer.parseInt(user.getBirthday().substring(5, 7)));
		user.setBirthDate(Integer.parseInt(user.getBirthday().substring(8, 10)));
		model.addAttribute("user", user);

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="boardnum", defaultValue="") String boardnum,
			@RequestParam(value="forBoardForm", defaultValue="") String forBoardForm,
			@RequestParam(value="roomnum", defaultValue="") String roomnum,
			User user, HttpSession httpsession, Model model) {
		UserDAO dao=sqlsession.getMapper(UserDAO.class);
		User loginUser = dao.login(user);
		System.out.println("룸번호"+roomnum);
			if(loginUser!=null) {
				
				httpsession.setAttribute("loginId", loginUser.getUserid());
				System.out.println("login"+(String)httpsession.getAttribute("loginId"));
				//관심상품에서의 로그인 예외처리
				if(keyword.length()!=0){
					httpsession.setAttribute("forWihListLogin", true);
				return "redirect:/keywordSearch";}
				//좋아요기능에서의 로그인 예외처리
				else if(boardnum.length()!=0) {
					httpsession.setAttribute("forGoodHit", true);
				return "redirect:/boardDetail";
				}
				//게시판 내용입력 기능에서의 예외처리
				
				else if(forBoardForm.length()!=0) {
				return "boardRegistForm";
				}
				//채팅기능 예외처리
				else if(roomnum.length()!=0) {
					System.out.println("채팅예외");
					return "redirect:/chat";
				}
				//홈에서 로그인 성공한경우
				else
				return "redirect:/";
			}else{
				model.addAttribute("match","match");
				//로그인 실패한경우
				return "login";	
		}
		
	}
	
	@RequestMapping(value = "/loginAjax", method = RequestMethod.GET)
	public @ResponseBody String loginAjax(User user, HttpSession httpsession, Model model) {
		UserDAO dao=sqlsession.getMapper(UserDAO.class);
		User loginUser = dao.login(user);
		System.out.println(loginUser);
			if(loginUser!=null) {
				httpsession.setAttribute("loginId", loginUser.getUserid());
				System.out.println("ajax"+loginUser.getUserid());
				return "true";
			}else{
				model.addAttribute("match","match");
				return "false";	
		}
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(User user, HttpSession httpsession) {

		httpsession.invalidate();
		
		return "home";
	}

	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	public String updateUserInfo(User user, HttpSession httpsession) {
		user.setUserid((String) httpsession.getAttribute("loginId"));
		//select한 birthday이어주기
		user.setBirthday(user.getBirthYear()+"/"+user.getBirthMonth()+"/"+user.getBirthDate());
		UserDAO dao=sqlsession.getMapper(UserDAO.class);
		dao.updateUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(
			@RequestParam(value="wishList", defaultValue="false") boolean wishList
			, Model model) {
		if(wishList==true) {
			model.addAttribute("wishList", wishList);
		}
		return "login";
		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search() {
		
		
	}

}


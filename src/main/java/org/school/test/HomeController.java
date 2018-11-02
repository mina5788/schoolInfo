package org.school.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.school.test.vo.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}
	@RequestMapping(value = "/goHome", method = RequestMethod.GET)
	public String goHome() {

		return "home";
	}
	
	@RequestMapping(value = "/sitemap", method = RequestMethod.GET)
	public void sitemap() {

	}
	@RequestMapping(value = "/goChat", method = RequestMethod.GET)
	public String goChat(String roomnum,  HttpSession httpsession) {
		httpsession.setAttribute("roomnum", roomnum);
		httpsession.setAttribute("chat", "chat");
		return "redirect:/chat";
	}

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String test(@RequestParam(value="roomnum", defaultValue="") String roomnum, Locale locale, Model model, HttpSession httpsession) {
		if(roomnum.length()==0) {
		roomnum = (String) httpsession.getAttribute("roomnum");
		httpsession.removeAttribute("roomnum");
		httpsession.removeAttribute("chat");
		}
		model.addAttribute("roomName", roomnum);
		return "chat";
	}
	
	@RequestMapping(value = "/getDday", method = RequestMethod.GET)
	public @ResponseBody long getDday() {
			
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		    Calendar c1 = Calendar.getInstance();
		    
		    String end = "2019-01-19";
		    String start  = formatter.format(c1.getTime());
		    long diffdays = 0;

		        Date beginDate;
				try {
					beginDate = formatter.parse(start);
					Date endDate = formatter.parse(end);
					 // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			        long diff = endDate.getTime() - beginDate.getTime();
			        diffdays = diff / (24 * 60 * 60 * 1000);
			        
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return diffdays;
	}
	
	@RequestMapping(value = "/messageSave", method = RequestMethod.GET)
	public String messageSave(String data, Model model) {

		String[] temp = data.split("::::");
		
		Gson gson = new Gson();
		Message[] array = gson.fromJson(temp[1], Message[].class);
		List<Message> list = Arrays.asList(array);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "messageSave";
	}
	

}

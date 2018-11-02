package org.school.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.school.test.dao.UserDAO;
import org.school.test.dao.WishListDAO;
import org.school.test.vo.User;
import org.school.test.vo.WishList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WishListController {
	@Autowired 
	SqlSession sqlsession;;

	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public @ResponseBody String insertWishList(WishList wishlist, HttpSession httpsession) {
	
		wishlist.setUserid((String) httpsession.getAttribute("loginId"));
		
		WishListDAO dao=sqlsession.getMapper(WishListDAO.class);
		System.out.println(wishlist.toString());
		dao.insertWishList(wishlist);
		System.out.println(22);
		return "success";
	}
	
}


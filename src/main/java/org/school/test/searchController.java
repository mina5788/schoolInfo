package org.school.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class searchController {

	
	@RequestMapping(value = "/keywordSearch", method = RequestMethod.GET)
	public String test(@RequestParam(value="search", defaultValue=" ") String search, Locale locale, Model model, HttpSession httpsession) {
		System.out.println(search);
		String targetUrl = /*"https://webservice.recruit.co.jp/shingaku/subject/v1/?key=89226a42a93d47b3&format=json&keyword=";*/
		/*"http://webservice.recruit.co.jp/shingaku/school/v2?pref_cd=12&key=89226a42a93d47b3&format=json&keyword=";*/
		"http://webservice.recruit.co.jp/shingaku/school/v1/?key=89226a42a93d47b3&pref_cd=12&pref_cd=13&format=json&keyword=";
		if(httpsession.getAttribute("forWihListLogin")==null) {
			httpsession.setAttribute("keyword", search);}
		search = (String) httpsession.getAttribute("keyword");
		if(httpsession.getAttribute("forWihListLogin")!=null) {
			httpsession.removeAttribute("forWihListLogin");
		}
		URL url = null;
	    HttpURLConnection conn = null;
	    String jsonData = "";
	    BufferedReader br = null;
	    StringBuffer sb = null;
	    
	    try {
	        url = new URL(targetUrl+search);
	 
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setRequestMethod("GET");
	        conn.connect();
	 
	        sb = new StringBuffer();
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	 
	        while ((jsonData = br.readLine()) != null) {
	            sb.append(jsonData);
	        }
	 
	 
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (br != null) br.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    System.out.println(sb.toString());
	    
	    try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(sb.toString());

            model.addAttribute("json", jsonObj);

        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	

		return "search";
	}
}

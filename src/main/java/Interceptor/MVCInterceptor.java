package Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MVCInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId == null) {
			
			response.sendRedirect(request.getContextPath() + "/loginForm");
			
			return false;
		}else {
	
			return true;
			
		}
		
	}

}

package kr.ac.kopo.planout.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.planout.model.Member;

public class Admininterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		Member member = (Member) session.getAttribute("member");
		
		if(member != null && member.getAdmin()==1)
			return true;
		
		if(member == null)
			response.sendRedirect("/login");
		else
			response.sendRedirect("/");
		
		return false;
	}
	
}

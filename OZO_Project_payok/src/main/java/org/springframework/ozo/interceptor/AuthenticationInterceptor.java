package org.springframework.ozo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ozo.controller.MemberSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		MemberSession ms = (MemberSession) session.getAttribute("memberSession");
		
		if ( ms == null ){
			if ( request.getServletPath().equals("/space/newReserve"))
				request.getSession().setAttribute("prevPage", request.getServletPath()+"?space_id=" + request.getParameter("space_id"));
			else
				request.getSession().setAttribute("prevPage", request.getServletPath());
		    System.out.print(request.getParameterMap());
			response.sendRedirect("../member/login");
			return false; 
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

}

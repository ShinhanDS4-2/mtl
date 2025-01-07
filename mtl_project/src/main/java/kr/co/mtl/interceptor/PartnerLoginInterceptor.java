package kr.co.mtl.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PartnerLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		// 세션에서 로그인 여부 확인
		Object partnerUser = session.getAttribute("login_partner_idx");
		if (partnerUser == null) {
			// 로그인하지 않은 경우 로그인 페이지로 리다이렉트
			response.sendRedirect("/mtl/partner/login");
			return false;
		}
		
		return true;
	}
}
package kr.co.goodee.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	// controller 접근 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		System.out.println("preHandle");
		
		// 1. handler 종류 확인
		// 우리가 관심 있는 것은 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크
		if( handler instanceof HandlerMethod == false ) {
			// return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
			return true;
		}
		
		// 2.형 변환
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		// 3. @Auth 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		Auth adminRole = handlerMethod.getMethod().getDeclaringClass().getAnnotation(Auth.class);
		
		// 4. method에 @Auth가 없는 경우, 즉 인증이 필요 없는 요청
		if( auth == null ) {
			return true;
		}
		
		// 5. @Auth가 있는 경우이므로, 세션이 있는지 체크
		HttpSession session = request.getSession();
		
		if( session.getAttribute("loginId") == null ) {
			// 로그인 화면으로 이동
			System.out.println("잘못된 접근 시도");
			ModelAndView mav = new ModelAndView(); 
			mav.addObject("msg", "잘못된 접근입니다");
			mav.setViewName("/home");
			throw new ModelAndViewDefiningException(mav);
			/* response.sendRedirect("/goodee/"); */
			/* return false; */
		}
		
		// 7. admin일 경우
		/*if( adminRole != null ) {
			String role = adminRole.role().toString();
			if( "ADMIN".equals(role) ) {
				if( "root".equals(authUser.getId()) == false ){
					response.sendRedirect(request.getContextPath());
					return false;
				}
			}
		}
		*/
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}

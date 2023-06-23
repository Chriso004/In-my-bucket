package com.group7.inmybucket.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.group7.inmybucket.service.GroupMemberService;

public class GroupInterceptor implements HandlerInterceptor {
	@Autowired
	private GroupMemberService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		HttpSession session = request.getSession();
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));

		if (session.getAttribute("logId") == null
				|| !service.isMember((String) session.getAttribute("logId"), groupNo)) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter printwriter = response.getWriter();
				printwriter.print("<script>alert('권한이 없는 사용자입니다.'); document.location.href = \"/inmybucket\";</script>");
				printwriter.flush();
				printwriter.close();

				return false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return true;
	}
}

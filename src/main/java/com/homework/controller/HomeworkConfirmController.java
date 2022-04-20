package com.homework.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeworkConfirmController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String[] correctList = request.getParameterValues("correctList");
		String[] explanList = request.getParameterValues("explanList");
		String homeworkId = request.getParameter("homeworkId");
		String studentId = request.getParameter("studentId");
		
		System.out.println(homeworkId+", "+studentId);
		
		HomeworkService service = HomeworkService.getInstance();
		service.confirmCorrect(correctList, homeworkId, studentId);
		service.confirmExplan(explanList, homeworkId, studentId);
		service.confirm(homeworkId, studentId);
		request.setAttribute("homeworkId", homeworkId);	
		HTTPUtil.forward(request, response, "/index.jsp");
	}
}

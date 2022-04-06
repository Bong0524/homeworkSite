package com.homework.controller;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homework.vo.HomeworkInfo;

public class HomeworkListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		HomeworkService service = HomeworkService.getInstance();
		ArrayList<HomeworkInfo> homeworkList = service.homeworkList();
		String grade = request.getParameter("grade");
		String clas = request.getParameter("clas");
		String subject = request.getParameter("subject");
		String filter = request.getParameter("filter");
		String path = null;
		if(filter.equals("all")) {
			path = "/index.jsp";
		}else if(filter.equals("update")) {
			path = "/memberUpdate.jsp";
		}else if(filter.equals("delete")) {
			path = "/memberDelete.jsp";
		}
		request.setAttribute("homeworkList", homeworkList);
		HTTPUtil.forward(request, response, path);

	}
}

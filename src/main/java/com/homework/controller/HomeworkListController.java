package com.homework.controller;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homework.vo.HomeworkInfo;

public class HomeworkListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String grade = request.getParameter("grade");
		String clas = request.getParameter("clas");
		String subject = request.getParameter("subject");
		String filter = request.getParameter("filter");
		String path = null;
		HomeworkService service = HomeworkService.getInstance();
		ArrayList<HomeworkInfo> homeworkList = null;
		if(filter.equals("All")) {
			homeworkList = service.homeworkList();
			path = "/homeworkListAll.jsp";
		}else if(filter.equals("Clas")) {
			homeworkList = service.homeworkList(grade,clas);
			path = "/homeworkListClas.jsp";
		}
		request.setAttribute("homeworkList", homeworkList);
		request.setAttribute("filter", filter);
		HTTPUtil.forward(request, response, path);
	}
}

package com.homework.controller;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homework.vo.HomeworkInfo;
import com.homework.vo.QuestInfo;

public class HomeworkOpenController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String homeworkId = request.getParameter("homeworkId");
		String how = request.getParameter("how");
		String path = null;
		HomeworkService service = HomeworkService.getInstance();
		HomeworkInfo homework = null;
		ArrayList<QuestInfo> questList = null;
		
		if(how.equals("open")) path = "/homeworkOpen.jsp";
		else if(how.equals("resolve")) path = "/homeworkResolve.jsp";
		
		homework = service.homework(homeworkId);
		questList = service.questList(homeworkId);
		
		request.setAttribute("homework", homework);
		request.setAttribute("questList", questList);
		
		HTTPUtil.forward(request, response, path);
	}
}

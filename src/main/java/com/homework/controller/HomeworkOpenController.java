package com.homework.controller;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homework.vo.HomeworkInfo;
import com.homework.vo.QuestInfo;
import com.homework.vo.SubmitInfo;
import com.homework.vo.SubmitQInfo;
import com.homework.vo.UserInfo;

public class HomeworkOpenController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		HttpSession session = request.getSession();
		UserInfo user = (UserInfo)session.getAttribute("user");
		String homeworkId = request.getParameter("homeworkId");
		String how = request.getParameter("how");
		String path = null;
		
		HomeworkService service = HomeworkService.getInstance();
		HomeworkInfo homework = service.homework(homeworkId);
		ArrayList<QuestInfo> questList = service.questList(homeworkId);
		String resolved = service.resolved(homeworkId, user);
		ArrayList<SubmitQInfo> submitQList = service.submitQList(homeworkId,user);
		SubmitInfo submission = service.submission(homeworkId,user);
		System.out.println(resolved);
		if(resolved.equals("0")) {
			if(how.equals("open")) path = "/homeworkOpen.jsp";
			else if(how.equals("resolve")) path = "/homeworkResolve.jsp";
		}else if(resolved.equals("1")) {
			path = "/homeworkResolved.jsp";
		}
			
		request.setAttribute("homework", homework);
		request.setAttribute("questList", questList);
		request.setAttribute("submitQList", submitQList);
		request.setAttribute("submission", submission);
		
		HTTPUtil.forward(request, response, path);
	}
}

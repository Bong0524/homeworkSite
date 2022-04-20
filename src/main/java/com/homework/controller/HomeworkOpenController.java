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
		String studentId = request.getParameter("studentId");
		String how = request.getParameter("how");
		String path = null;
		
		HomeworkService service = HomeworkService.getInstance();
		HomeworkInfo homework = service.homework(homeworkId);
		
		ArrayList<QuestInfo> questList = service.questList(homeworkId);
		String resolved = service.resolved(homeworkId, user);
		
		ArrayList<SubmitQInfo> submitQList = null;
		SubmitInfo submission = null;
		
		ArrayList<SubmitInfo> submitList = null;
		
		
		//해당 숙제의 학년과 반이 일치하는 선생일 경우
		if(user != null && user.getPosition().equals("선생") && user.getGrade().equals(homework.getGrade()) && user.getClas().equals(homework.getClas())) {
			System.out.println("해당반 선생");
			if(studentId == null) {
				submitList = service.submitList(homeworkId);
				path = "homeworkOpenSubmitList.jsp";
			}else{
				submitQList = service.submitQList(homeworkId, studentId);
				submission = service.submission(homeworkId, studentId);
				path = "homeworkConfirm.jsp";
			}
			//학생
		}else {
			//문제를 풀지 않았을경우
			if(resolved.equals("0")) {
				if(how.equals("open")) path = "/homeworkOpen.jsp";
				else if(how.equals("resolve")) path = "/homeworkResolve.jsp";
			//문제를 풀었을 경우
			}else if(resolved.equals("1")) {
				submitQList = service.submitQList(homeworkId,user);
				submission = service.submission(homeworkId,user);
				if(submission.getConfirm().equals("0")) path = "/homeworkConfirmYet.jsp";
				else if(submission.getConfirm().equals("1")) path = "/homeworkConfirmed.jsp";
			}
		}
		
		request.setAttribute("homework", homework);
		request.setAttribute("questList", questList);
		request.setAttribute("submitQList", submitQList);
		request.setAttribute("submission", submission);
		request.setAttribute("submitList", submitList);
		
		HTTPUtil.forward(request, response, path);
	}
}

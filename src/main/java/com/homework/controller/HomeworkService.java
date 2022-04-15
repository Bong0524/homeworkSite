package com.homework.controller;

import java.util.ArrayList;

import com.homework.vo.ClassInfo;
import com.homework.vo.HomeworkInfo;
import com.homework.vo.QuestInfo;
import com.homework.vo.SubmitList;
import com.homework.vo.UserInfo;

public class HomeworkService {
	private static HomeworkService service = new HomeworkService();
	
	public HomeworkDAO dao = HomeworkDAO.getInstance();
	public static HomeworkService getInstance() {
		return service;
	}
	
	public ArrayList<HomeworkInfo> homeworkList(String subject) {
		return dao.HomeworkList(subject);
	}
	public ArrayList<HomeworkInfo> homeworkList(String grade,String clas, String subject) {
		return dao.HomeworkList(grade,clas,subject);
	}
	public HomeworkInfo homework(String homeworkId) {
		return dao.Homework(homeworkId);
	}
	public ArrayList<QuestInfo> questList(String homeworkId) {
		return dao.QuestList(homeworkId);
	}
	public void homeworkSubmit(String homeworkId, String questNum, String answer, UserInfo user) {
		dao.HomeworkSubmit(homeworkId,questNum,answer,user);
	}

	public UserInfo user(String id) {
		return dao.User(id);
	}

	public ArrayList<ClassInfo> classList() {
		return dao.ClassList();
	}

	public String resolved(UserInfo user) {
		return dao.Resolved(user);
	}

	public ArrayList<SubmitList> submitList(String homeworkId, UserInfo user) {
		return dao.SubmitList(homeworkId, user);
	}


}

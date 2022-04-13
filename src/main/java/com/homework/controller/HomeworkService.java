package com.homework.controller;

import java.util.ArrayList;

import com.homework.vo.HomeworkInfo;
import com.homework.vo.QuestInfo;

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
}

package com.homework.controller;

import java.util.ArrayList;

import com.homework.vo.HomeworkInfo;

public class HomeworkService {
	private static HomeworkService service = new HomeworkService();
	
	public HomeworkDAO dao = HomeworkDAO.getInstance();
	public static HomeworkService getInstance() {
		return service;
	}
	
	public ArrayList<HomeworkInfo> homeworkList() {
		return dao.HomeworkList();
	}
	public ArrayList<HomeworkInfo> homeworkList(String grade,String clas) {
		return dao.HomeworkList(grade,clas);
	}
	public ArrayList<HomeworkInfo> homeworkSearch(String filter) {
		return dao.HomeworkList();
	}
}

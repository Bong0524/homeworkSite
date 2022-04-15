package com.homework.vo;

import java.sql.Date;

public class SubmitList {
	private String homeworkId; 
	private String questNum; 
	private String answer; 
	private String id; 
	private String num; 
	private String name; 
	private Date subDate; 
	private String feedback;
	public String getHomeworkId() {
		return homeworkId;
	}
	public void setHomeworkId(String homeworkId) {
		this.homeworkId = homeworkId;
	}
	public String getQuestNum() {
		return questNum;
	}
	public void setQuestNum(String questNum) {
		this.questNum = questNum;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getSubDate() {
		return subDate;
	}
	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	} 
}

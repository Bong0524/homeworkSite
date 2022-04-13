package com.homework.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.homework.base.JDBCConnection;
import com.homework.vo.HomeworkInfo;
import com.homework.vo.QuestInfo;

public class HomeworkDAO {
	private static HomeworkDAO dao = new HomeworkDAO();
	
	public static HomeworkDAO getInstance() {
		return dao;
	}
	public ArrayList<HomeworkInfo> HomeworkList(String subject){
		System.out.println("all List, subject : "+subject);
		ArrayList<HomeworkInfo> homeworkList = new ArrayList<HomeworkInfo>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select homeworkId, grade, class, title, subject, stDate, ps, enDate, ceil(enDate - sysdate+1)as timeout from hw_homework ";
			if(subject != null) sql += " where subject = "+"'"+subject+"' ";
			sql += " order by (case when timeout > 0 then 1 end), timeout ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				HomeworkInfo homework = new HomeworkInfo();
				homework.setHomeworkId(rs.getString(1));
				homework.setGrade(rs.getString(2));
				homework.setClas(rs.getString(3));
				homework.setTitle(rs.getString(4));
				homework.setSubject(rs.getString(5));
				homework.setPs(rs.getString(6));
				homework.setStDate(rs.getDate(7));
				homework.setEnDate(rs.getDate(8));
				homework.setTimeout(rs.getInt(9));
				homeworkList.add(homework);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return homeworkList;
	}
	
	public ArrayList<HomeworkInfo> HomeworkList(String grade, String clas, String subject){
		System.out.println("clas List, grade : "+grade+", clas : "+clas+", subject : "+subject);
		ArrayList<HomeworkInfo> homeworkList = new ArrayList<HomeworkInfo>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select homeworkId, grade, class, title, subject, ps, stDate, enDate, ceil(enDate - sysdate+1)as timeout from hw_homework where grade = ? and class = ? ";
			if(subject != null) sql += "and subject = "+"'"+subject+"' ";
			sql += " order by (case when timeout > 0 then 1 end), timeout ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, grade);
			stmt.setString(2, clas);
			rs = stmt.executeQuery();
			while(rs.next()) {
				HomeworkInfo homework = new HomeworkInfo();
				homework.setHomeworkId(rs.getString(1));
				homework.setGrade(rs.getString(2));
				homework.setClas(rs.getString(3));
				homework.setTitle(rs.getString(4));
				homework.setSubject(rs.getString(5));
				homework.setPs(rs.getString(6));
				homework.setStDate(rs.getDate(7));
				homework.setEnDate(rs.getDate(8));
				homework.setTimeout(rs.getInt(9));
				homeworkList.add(homework);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return homeworkList;
	}
	public HomeworkInfo Homework(String homeworkId) {
		System.out.println("openHomework : "+homeworkId);
		HomeworkInfo homework = new HomeworkInfo();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select homeworkId, grade, class, title, subject, ps, stDate, enDate, ceil(enDate - sysdate+1)as timeout from hw_homework where homeworkId = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, homeworkId);
			rs = stmt.executeQuery();
			if(rs.next()) {
				homework.setHomeworkId(rs.getString(1));
				homework.setGrade(rs.getString(2));
				homework.setClas(rs.getString(3));
				homework.setTitle(rs.getString(4));
				homework.setSubject(rs.getString(5));
				homework.setPs(rs.getString(6));
				homework.setStDate(rs.getDate(7));
				homework.setEnDate(rs.getDate(8));
				homework.setTimeout(rs.getInt(9));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return homework;
	}
	
	public ArrayList<QuestInfo> QuestList(String homeworkId){
		System.out.println("QuestList : "+homeworkId);
		ArrayList<QuestInfo> questList = new ArrayList<QuestInfo>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from hw_quest where homeworkId = ? order by questNum";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, homeworkId);
			rs = stmt.executeQuery();
			while(rs.next()) {
				QuestInfo quest = new QuestInfo();
				quest.setHomeworkId(rs.getString(1));
				quest.setQuestNum(rs.getString(2));
				quest.setKind(rs.getString(3));
				quest.setQuest(rs.getString(4));
				quest.setAnswer(rs.getString(5));
				quest.setFirst(rs.getString(6));
				quest.setSecond(rs.getString(7));
				quest.setThird(rs.getString(8));
				quest.setFourth(rs.getString(9));
				quest.setFifth(rs.getString(10));
					
				questList.add(quest);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return questList;
	}
}

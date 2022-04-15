package com.homework.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.homework.base.JDBCConnection;
import com.homework.vo.ClassInfo;
import com.homework.vo.HomeworkInfo;
import com.homework.vo.QuestInfo;
import com.homework.vo.SubmitList;
import com.homework.vo.UserInfo;

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
	public void HomeworkSubmit(String homeworkId, String questNum, String answer, UserInfo user) {
		System.out.println("submit - name : " + user.getName() + " homeworkId : " + homeworkId +" questNum : "+ questNum + " answer : " + answer);
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCConnection.getConnection();
			String sql = "insert into hw_submit(homeworkId,questNum,answer,id,num,name) values(?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, homeworkId);
			stmt.setString(2, questNum);
			stmt.setString(3, answer);
			stmt.setString(4, user.getId());
			stmt.setString(5, user.getNum());
			stmt.setString(6, user.getName());
			
			int cnt = stmt.executeUpdate();
			System.out.println(cnt);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt);
		}
	}
	public UserInfo User(String id) {
		System.out.println("id : " +id);
		UserInfo user = new UserInfo();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from hw_user where id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				user.setId(rs.getString(1));
				user.setPw(rs.getString(2));
				user.setName(rs.getString(3));
				user.setTel(rs.getString(4));
				user.setParent(rs.getString(5));
				user.setGrade(rs.getString(6));
				user.setClas(rs.getString(7));
				user.setNum(rs.getString(8));
				user.setPosition(rs.getString(9));
				user.setConfirm(rs.getString(10));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return user;
	}
	public ArrayList<ClassInfo> ClassList() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ClassInfo> classList = new ArrayList<>();
		
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from hw_class"; 
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();	
			while(rs.next()){
				ClassInfo clas = new ClassInfo();
				clas.setGrade(rs.getString(1));
				clas.setClas(rs.getString(2));
				classList.add(clas);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return classList;
	}
	public String Resolved(UserInfo user) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String resovled = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select id from hw_submit where homeworkId = 0 and id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user != null ? user.getId() : "");
			rs = stmt.executeQuery();
			resovled = rs.next() ? "1" : "0";
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return resovled;
	}
	public ArrayList<SubmitList> SubmitList(String homeworkId, UserInfo user) {
		ArrayList<SubmitList> submitList = new ArrayList<SubmitList>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from hw_submit where homeworkId = ? and id = ? order by questNum";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, homeworkId);
			stmt.setString(2, user != null ? user.getId() : "");
			rs = stmt.executeQuery();
			while(rs.next()) {
				SubmitList submission = new SubmitList();
				submission.setHomeworkId(rs.getString(1));
				submission.setQuestNum(rs.getString(2));
				submission.setAnswer(rs.getString(3));
				submission.setId(rs.getString(4));
				submission.setNum(rs.getString(5));
				submission.setName(rs.getString(6));
				submission.setSubDate(rs.getDate(7));
				submission.setFeedback(rs.getString(8));
					
				submitList.add(submission);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(conn, stmt, rs);
		}
		return submitList;
	}
}

package com.homework.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.homework.base.JDBCConnection;
import com.homework.vo.HomeworkInfo;

public class HomeworkDAO {
	private static HomeworkDAO dao = new HomeworkDAO();
	
	public static HomeworkDAO getInstance() {
		return dao;
	}
	public ArrayList<HomeworkInfo> HomeworkList(){
		System.out.println("all List");
		ArrayList<HomeworkInfo> homeworkList = new ArrayList<HomeworkInfo>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from hw_homework";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				HomeworkInfo homework = new HomeworkInfo();
				homework.setHomeworkId(rs.getString(1));
				homework.setGrade(rs.getString(2));
				homework.setClas(rs.getString(3));
				homework.setTitle(rs.getString(4));
				homework.setSubject(rs.getString(5));
				homework.setStDate(rs.getDate(6));
				homework.setEnDate(rs.getDate(7));
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
	
	public ArrayList<HomeworkInfo> HomeworkList(String grade, String clas){
		ArrayList<HomeworkInfo> homeworkList = new ArrayList<HomeworkInfo>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			System.out.println("clas List");
			
			conn = JDBCConnection.getConnection();
			String sql = "select * from hw_homework where grade = ? and class = ?";
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
				homework.setStDate(rs.getDate(6));
				homework.setEnDate(rs.getDate(7));
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
}

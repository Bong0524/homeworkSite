package com.homework.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HTTPUtil {
	public static void forward(HttpServletRequest request, HttpServletResponse response, String path) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		try {
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("forward 오류 : " + e);
			e.printStackTrace();
		}
	}
}

package model2.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model2.member.dto.MemberDTO;
import model2.member.service.MemberService;
import model2.member.service.MemberServiceImpl;

@WebServlet("*.json")
public class MemberAPIController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService service;
	Gson gson;
	public MemberAPIController() {
		System.out.println("MemberAPIController");
		service = new MemberServiceImpl();
		gson = new Gson();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// json 한글 처리
		response.setContentType("application/json;charset=UTF-8");
		
		// request path 추출
	    String uri = request.getRequestURI();
	    System.out.println(uri); 
	    String action = uri.substring(uri.lastIndexOf("/"));
	    System.out.println(action);	    
	    
	    if(action.equals("/List.json")) {
	    	List<MemberDTO> members = service.selectList();
	    	
	    	String membersJson = gson.toJson(members);	    	
	    	
	    	System.out.println(membersJson);
	    	
	    	PrintWriter writer = response.getWriter();
	    	writer.print(membersJson);
	    	
	    }else if(action.equals("/WriteProcess.json")){
	    	
	    	// json 문자열 처리
	    	BufferedReader reader = request.getReader();
	        String memberJson = reader.readLine();
	        
	        MemberDTO dto = gson.fromJson(memberJson, MemberDTO.class);
	    	System.out.println(dto);
	        
	    	int rs = service.insertWrite(dto);
	    	//int rs = 1;
	    	
	    	Map<String, String> rsMap = new HashMap<String, String>();
	    	rsMap.put("rs", rs+"");
	    	String rsJson = gson.toJson(rsMap);	
	    	
	    	System.out.println(rsJson);
	    	
	    	PrintWriter writer = response.getWriter();
	    	writer.print(rsJson);
	    	
	    }else if(action.equals("/View.json")) {
	    	String id = request.getParameter("id");
	    	MemberDTO member = service.selectView(id);
	    	
	    	String memberJson = gson.toJson(member);	    	
	    	
	    	System.out.println(memberJson);
	    	
	    	PrintWriter writer = response.getWriter();
	    	writer.print(memberJson);
	    	
	    }else if(action.equals("/EditProcess.json")){
	    	
	    	// json 문자열 처리
	    	BufferedReader reader = request.getReader();
	        String memberJson = reader.readLine();
	        
	        MemberDTO dto = gson.fromJson(memberJson, MemberDTO.class);
	    	System.out.println(dto);
	        
	    	int rs = service.updateEdit(dto);
	    	//int rs = 1;
	    	
	    	Map<String, String> rsMap = new HashMap<String, String>();
	    	rsMap.put("rs", rs+"");
	    	rsMap.put("id", dto.getId());
	    	String rsJson = gson.toJson(rsMap);	
	    	
	    	System.out.println(rsJson);
	    	
	    	PrintWriter writer = response.getWriter();
	    	writer.print(rsJson);
	    	
	    }else if(action.equals("/DeleteProcess.json")){
	    	
	    	String id = request.getParameter("id");
	    	
	    	int rs = service.delete(id);
	    	//int rs = 1;
	    	
	    	Map<String, String> rsMap = new HashMap<String, String>();
	    	rsMap.put("rs", rs+"");
	    	String rsJson = gson.toJson(rsMap);	
	    	
	    	System.out.println(rsJson);
	    	
	    	PrintWriter writer = response.getWriter();
	    	writer.print(rsJson);
	    	
	    }
	}

}

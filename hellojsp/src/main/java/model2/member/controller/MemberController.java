package model2.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

import model1.member.dao.MemberDAO;
import model2.member.dto.MemberDTO;
import model2.member.service.MemberService;
import model2.member.service.MemberServiceImpl;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	MemberService service;
	
	public MemberController() {
		service = new MemberServiceImpl();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request path 추출
    String uri = request.getRequestURI();
    System.out.println(uri); 
    String action = uri.substring(uri.lastIndexOf("/"));
    System.out.println(action);
    
    if(action.equals("/List.do")) {
    	List<MemberDTO> members = service.selectList();
    	
    	request.setAttribute("members", members);
    	
    	String path = "List.jsp";
    	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    	dispatcher.forward(request, response);
    }else if(action.equals("/Write.do")) {
    	
    	String path = "Write.jsp";
    	response.sendRedirect(path);
    }else if(action.equals("/WriteProcess.do")) {
    	
    	String id = request.getParameter("id");
  		String pass = request.getParameter("pass");
  		String name = request.getParameter("name");
  		
  		MemberDTO dto = new MemberDTO(id, pass, name);
    	
    	int rs = service.insertWrite(dto);
    	
    	String path = "List.do";
    	response.sendRedirect(path);
    }else if(action.equals("/View.do")) {
    	
    	String id = request.getParameter("id");
    	
    	MemberDTO member = service.selectView(id);
    	
    	request.setAttribute("member", member);
    	
    	String path = "View.jsp";
    	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    	dispatcher.forward(request, response);
    }else if(action.equals("/Edit.do")) {
    	
    	String id = request.getParameter("id");
    	
    	MemberDTO member = service.selectView(id);
    	
    	request.setAttribute("member", member);
    	
    	String path = "Edit.jsp";
    	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    	dispatcher.forward(request, response);
    }else if(action.equals("/EditProcess.do")) {
    	
    	String id = request.getParameter("id");
  		String pass = request.getParameter("pass");
  		String name = request.getParameter("name");
  		
  		MemberDTO dto = new MemberDTO(id, pass, name);
  		
  		int rs = service.updateEdit(dto);
  		
  		//작업 후 페이지 이동
  		String path = "View.do?id="+id;
    	response.sendRedirect(path);
    }else if(action.equals("/DeleteProcess.do")) {
    	
    	String id = request.getParameter("id");
    	
    	int rs = service.delete(id);
    	
    	String path = "List.do";
    	response.sendRedirect(path);
    }
	}

}

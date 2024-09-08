package model1.member.process;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.member.dao.MemberDAO;
import model1.member.dto.MemberDTO;

@WebServlet("/EditProcess")
public class EditProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ServletContext application;
	
    @Override
    public void init(ServletConfig config) throws ServletException {    
    	application = config.getServletContext();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//폼값 받기
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		
		MemberDTO dto = new MemberDTO(id, pass, name);
		MemberDAO dao = new MemberDAO(application);
		dao.updateEdit(dto);
		dao.close();
		
		//작업 후 페이지 이동
		response.sendRedirect("./05JDBCMemberServlet/View.jsp?id="+id);
	}
	
	

	
}

package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Sach;
import bo.SachBO;
import dao.SachDAO;

/**
 * Servlet implementation class GiaodienController
 */
@WebServlet("/GiaodienController")
public class GiaodienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       SachBO bo= new  SachBO();
       Sach  bean = new Sach();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiaodienController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String masach = request.getParameter("masach_select");
		if(masach != null && !masach.isEmpty()) {
			Sach sach =new Sach();
			sach = bo.Find(masach);
			System.out.println(sach.getTensach());
			session.setAttribute("Sach", sach);
		}else session.removeAttribute("Sach");
		RequestDispatcher rd = request.getRequestDispatcher("giaodien.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

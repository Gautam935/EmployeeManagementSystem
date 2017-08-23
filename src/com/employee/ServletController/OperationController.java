package com.employee.ServletController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OperationController")
public class OperationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public void init(ServletConfig config) throws ServletException {
		try {
			super.init(config);

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:ABC", "gautam",
					"kumar");

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}

	}

	public void distroy() {
		try {
			pst.close();
			con.close();
		} catch (Exception ex) {
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();

		try {

			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet Operation</title>");
			out.println("</head>");
			out.println("<body>");

			if (req.getParameter("rest").equals("INSERT")) {
				try {
					pst = con
							.prepareStatement("insert into proj(reg,name,address,dept,mob,email,dob,doj,sal)values(?,?,?,?,?,?,?,?,?)");

					int r = Integer.parseInt(req.getParameter("r1"));
					String name = req.getParameter("n");
					String address = req.getParameter("add");
					String dept = req.getParameter("dept");
					int mob = Integer.parseInt(req.getParameter("mob"));
					String email = req.getParameter("email");
					String dob = req.getParameter("dob");
					String doj = req.getParameter("doj");
					int sal = Integer.parseInt(req.getParameter("sal"));

					pst.setInt(1, r);
					pst.setString(2, name);
					pst.setString(3, address);
					pst.setString(4, dept);
					pst.setInt(5, mob);
					pst.setString(6, email);
					pst.setString(7, dob);
					pst.setString(8, doj);
					pst.setInt(9, sal);

					int i = pst.executeUpdate();
					res.sendRedirect("/Project/insertEmp.jsp?info=" + i
							+ " Record Inserted");
				} catch (Exception e) {
					e.getMessage();
				}
			} else if (req.getParameter("rest").equals("UPDATE")) {
				try {
					pst = con
							.prepareStatement("update proj set name=?,address=?,dept=?,mob=?,email=?,dob=?,doj=?,sal=? where reg=?");

					int r = Integer.parseInt(req.getParameter("r1"));
					String name = req.getParameter("n");
					String address = req.getParameter("add");
					String dept = req.getParameter("dept");
					int mob = Integer.parseInt(req.getParameter("mob"));
					String email = req.getParameter("email");
					String dob = req.getParameter("dob");
					String doj = req.getParameter("doj");
					int sal = Integer.parseInt(req.getParameter("sal"));

					pst.setString(1, name);
					pst.setString(2, address);
					pst.setString(3, dept);
					pst.setInt(4, mob);
					pst.setString(5, email);
					pst.setString(6, dob);
					pst.setString(7, doj);
					pst.setInt(8, sal);
					pst.setInt(9, r);

					int i = pst.executeUpdate();
					res.sendRedirect("/Project/updateEmp.jsp?info=" + i
							+ " Record Updated");
				} catch (Exception e) {
					e.getMessage();
				}
			}

			else if (req.getParameter("rest").equals("DELETE")) {
				out.println("Delete");
				try {
					pst = con.prepareStatement("delete from proj where reg=?");
					int id = Integer.parseInt(req.getParameter("r1"));
					pst.setInt(1, id);

					int i = pst.executeUpdate();

					res.sendRedirect("/Project/deleteEmp.jsp?info=" + i
							+ " Record Deleted");
				} catch (Exception e) {
					e.getMessage();
				}
			}
			out.println("</body>");
			out.println("</html>");
		} finally {
			out.close();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}

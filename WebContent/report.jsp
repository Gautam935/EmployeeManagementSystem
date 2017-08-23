<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
Statement st=null;
String str=null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div id="container">
        <div class="mainContainer">
        <div id="logo">
            <img alt="Logo" src="/EmployeeManagementSystem/Images/Tulips.jpg" height="200px" width="968px"/>
        </div>
        <div id="scroll"><marquee>Welcome To Employee Information System</marquee></div>
        <div class="menuContent">
                <a href="index.jsp">Home</a><a href="insertEmp.jsp">Insert</a><a href="updateEmp.jsp">Update</a><a href="deleteEmp.jsp">Delete</a><a href="report.jsp">Report</a><a href="contact.jsp">Contact US</a>
        </div>
        <div class="middleContent">
            <form name="f1" method="POST" action="">
            <table border='10'width='50' cellspacing='5'cellpadding='5' bgcolor='silver'>
            <caption style="font-weight: bold; font-size: 17px;">EMPLOYEE'S REPORT</caption>
            <tr><td>Registration Number: </td><td><input type=text name='r1' size='40'/></td></tr>
            </table>
            <p><input type='reset' name='clear' value='CLEAR'/><input type='submit' name='rest' value='SHOW'/></p>
            </form>
        
           
            

            <table>
                <caption><h3>DATABASE'S RECORD</h3></caption>
            <tr><th>Reg. No.</th><th>Name</th><th>Address</th><th>Department</th><th>Mob. No.</th><th>eMail</th><th>DOB</th><th>DOJ</th><th>Salary</th></tr>
        <%
            try
            {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con=DriverManager.getConnection("jdbc:odbc:dev","gautam","kumar");
            if(request.getParameter("r1")!=null)
            {
                str="select * from proj where reg=?";
                pst=con.prepareStatement(str);
                pst.setInt(1,Integer.parseInt(request.getParameter("r1")));
                rs=pst.executeQuery();
            }
            else
            {
                str="select * from proj";
                st=con.createStatement();
                rs=st.executeQuery(str);
            }
               while(rs.next())
               {
                %>
               
                <tr><td><% out.println(rs.getInt("reg")); %></td>
                <td><% out.println(rs.getString("name")); %></td>
                <td><% out.println(rs.getString("address")); %></td>
                <td><% out.println(rs.getString("dept")); %></td>
                <td><% out.println(rs.getInt("mob")); %></td>
                <td><% out.println(rs.getString("email")); %></td>
                <td><% out.println(rs.getString("dob")); %></td>
                <td><% out.println(rs.getString("doj")); %></td>
                <td><% out.println(rs.getInt("sal")); %></td>
                </tr>
                
                <%
               }
              }
              catch(SQLException sqle)
              {
                 out.println("Record Are Not Found");   
              }
        %>
        </table>
        </div>
        <br/><br/><br/><br/>
        </div>
        </div>
        <div class="footer">
            All Â© Copyright Reserved Â® to Employee Information System 2014. <br>
            This Web Site is Developed and Maintained by: <a href="https://facebook.com/shakti.aryan1994" style="text-decoration: none; color: white;">Shakti aryan</a>
        </div>
    </body>
</html>

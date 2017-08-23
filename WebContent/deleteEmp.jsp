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

<html>
    <head>
       
        <title>Delete Employee</title>
         <link rel="stylesheet" href="/EmployeeManagementSystem/style.css" type="text/css"/>
    </head>
    <body>
            <div id="container">
            <div class="mainContainer">
            <div id="logo">
            <img alt="Logo" src="/EmployeeManagementSystem/Images/Tulips.jpg" height="200px" width="968px"/>
            </div>
            <div id="scroll"> <marquee>Welcome To Employee Information System</marquee> </div>
                   
            <div class="menuContent">
               <a href="index.jsp">Home</a><a href="insertEmp.jsp">Insert</a><a href="updateEmp.jsp">Update</a><a href="deleteEmp.jsp">Delete</a><a href="report.jsp">Report</a><a href="contact.jsp">Contact US</a>
            </div> 
            
            <div class="middleContent">
                    <p><b style="color:red;">
            <%
            if(request.getParameter("info")!=null)
            out.println(request.getParameter("info"));
            %>
            </b></p>
            <form name="f1" action="http://localhost:8080/EmployeeManagementSystem/Operation" method="POST">
            <table border='10'width='50' cellspacing='5'cellpadding='5' bgcolor='silver'>
            <caption style="font-weight: bold; font-size: 17px;">EMPLOYEE'S DELETION DETAILS</caption>
             <tr>
                 
                 <td><b>Reg.No</b></td><td colspan="2">
             <select name="s1" id="s1">
           <%
             String str1="select reg from proj";
            try
            {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con=DriverManager.getConnection("jdbc:odbc:dev","gautam","kumar");
                st=con.createStatement();
                rs=st.executeQuery(str1);
                while(rs.next())
               {
                  %> 
                 <option> <% out.println(rs.getInt("reg")); %></option>
                <%
               }
               }
                 catch(SQLException sqle)
               {
                 out.println(sqle);     
               }
                 catch(ClassNotFoundException cnfe)
               {
                     out.println(cnfe);
               }
               %>
             </select>
             </td>
             </tr>
            <tr><td>REGNO</td><td><input type=text name='r1' value="Enter Reg.No To Be Deleted" size='40'/></td></tr>
            
            </table>
               
                
            <p><input type='reset' name='clear' value='CLEAR'/><input type='submit' name='rest' value='DELETE'/></p>
            </form>
            </div>
            </div>
            
            <div class="footer">
                 All Â© Copyright Reserved Â® to Employee Information System 2014. <br>
                 This Web Site is Developed and Maintained by: <a href="https://facebook.com/gautam" style="text-decoration: none; color: white;">Gautam Kumar</a>
            </div> 
    </body>
</html>

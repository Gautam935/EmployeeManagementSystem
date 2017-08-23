<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
       
        <title>Add Employee</title>
        <link rel="stylesheet" href="/EmployeeManagementSystem/style.css" type="text/css"/>
        
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
            
            <p><b style="color:red;">
            <%
            if(request.getParameter("info")!=null)
            out.println(request.getParameter("info"));
            %> 
            </b></p>
            <form name="f1" action="http://localhost:8080/EmployeeManagementSystem/OperationController" method="POST">
            <table border='10'width='50' cellspacing='5'cellpadding='5' bgcolor='silver'>
            <caption style="font-weight: bold; font-size: 17px;">EMPLOYEE'S DETAILS</caption>
            <tr><td>REGNO</td><td><input type=text name='r1' size='40'/></td></tr>
            <tr><td>NAME</td><td><input type=text name='n' size='40'/></td></tr>
            <tr><td>ADDRESS</td><td><input type=text name='add' size='40'/></td></tr>
            <tr><td>DEPARTMENT</td><td><select name="dept"><option>MCA</option><option>MBA</option><option>B.TECH</option><option>B.COM</option><option>BCA</option></select></td></tr>
            <tr><td>MOBILE.NO</td><td><input type=text name='mob' size='40'/></td></tr>
            <tr><td>EMAIL</td><td><input type=text name='email' size='40'/></td></tr>
            <tr><td>DOB</td><td><input type=text name='dob' size='40'/></td></tr>
            <tr><td>DOJ</td><td><input type=text name='doj' size='40'/></td></tr>
            <tr><td>SALARY</td><td><input type=text name='sal' size='40'/></td></tr>
            </table>
            <p><input type='reset' name='clear' value='CLEAR'/><input type='submit' name='rest' value='INSERT'/></p>
            </form>
        </div>
        </div>
        </div>
        <div class="footer">
            All Â© Copyright Reserved Â® to Employee Information System 2014. <br>
            This Web Site is Developed and Maintained by: <a href="https://facebook.com/gautam" style="text-decoration: none; color: white;">Gautam Kumar</a>
        </div>
    </body>
</html>

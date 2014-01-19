<%-- 
    Document   : addpost
    Created on : Jan 15, 2014, 1:30:39 PM
    Author     : George
--%>

<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%
    String userid=(String)session.getAttribute("userid");
    String title = request.getParameter("title");
    String post = request.getParameter("post");
    String category = request.getParameter("category");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into posts(userid, title, post, postdate, category) values ('" + userid + "','" + title + "','" + post + "', CURDATE(),'" + category + "')");
        
    if (i > 0) {
        
        response.sendRedirect("index.jsp");
       
    } else {
        response.sendRedirect("newpost.jsp");
    }
%>%>
 
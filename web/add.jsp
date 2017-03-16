<%@ page import="java.sql.*" %>
<%@ page import="com.sample.data.sys.Config" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/13
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String custom_num = request.getParameter("custom_num");
    String custom_name = request.getParameter("custom_name");
    String com_type = request.getParameter("com_type");
    String country = request.getParameter("country");
    String city = request.getParameter("city");
    String addr = request.getParameter("addr");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    PreparedStatement stmt = null;
    Connection conn = new Config(application).getConn();
    if (conn != null) {
        String sql = "insert into user values (?,?,?,?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1,custom_name);
        stmt.setString(2,com_type);
        stmt.setString(3,country);
        stmt.setString(4,city);
        stmt.setString(5,addr);
        stmt.setString(6,email);
        stmt.setString(7,phone);
        stmt.setString(8,custom_num);

        int flag = stmt.executeUpdate();
        out.print(flag);
    }
    stmt.close();
    conn.close();
%>

<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //定义列名
    //数据库里对应的列名
    String[] cols = {"custom_num", "custom_name", "com_type", "country", "city", "addr", "email", "phone"};
    Map<Object, Object> info = new HashMap<Object, Object>();
    info.put("data", cols);
    String json = new Gson().toJson(info);
    out.write(json);
%>

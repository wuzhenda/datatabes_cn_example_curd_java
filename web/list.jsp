<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sample.data.bean.User" %>
<%@ page import="com.sample.data.sys.Config" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map"%>
<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    ResultSet rs = null;
    Statement stmt = null;
    Connection conn = new Config(application).getConn();
    String table = "user";

    //获取请求次数
    String draw = "0";
    draw = request.getParameter("draw");
    //数据起始位置
    String start = request.getParameter("start");
    //数据长度
    String length = request.getParameter("length");

    //总记录数
    String recordsTotal = "0";

    //过滤后记录数
    String recordsFiltered = "";

    //定义列名
    String[] cols = {"custom_num","custom_name", "com_type", "country", "city", "addr", "email","phone"};
    //获取客户端需要那一列排序
    String orderColumn = "0";
    orderColumn = request.getParameter("order[0][column]");
    orderColumn = cols[Integer.parseInt(orderColumn)];
    //获取排序方式 默认为asc
    String orderDir = "asc";
    orderDir = request.getParameter("order[0][dir]");


    //获取用户过滤框里的字符
    String searchValue = request.getParameter("search[value]");

    List<String> sArray = new ArrayList<String>();
    if (!searchValue.equals("")) {
        sArray.add(" custom_num like '%" + searchValue + "%'");
        sArray.add(" custom_name like '%" + searchValue + "%'");
        sArray.add(" com_type like '%" + searchValue + "%'");
        sArray.add(" country like '%" + searchValue + "%'");
        sArray.add(" city like '%" + searchValue + "%'");
        sArray.add(" addr like '%" + searchValue + "%'");
        sArray.add(" email like '%" + searchValue + "%'");
        sArray.add(" phone like '%" + searchValue + "%'");
    }

    String individualSearch = "";
    if (sArray.size() == 1) {
        individualSearch = sArray.get(0);
    } else if (sArray.size() > 1) {
        for (int i = 0; i < sArray.size() - 1; i++) {
            individualSearch += sArray.get(i) + " or ";
        }
        individualSearch += sArray.get(sArray.size() - 1);
    }

    List<User> users = new ArrayList<User>();
    if (conn != null) {
        String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;
        stmt = conn.createStatement();
        //获取数据库总记录数
        String recordsTotalSql = "select count(1) as recordsTotal from " + table;
        rs = stmt.executeQuery(recordsTotalSql);
        while (rs.next()) {
            recordsTotal = rs.getString("recordsTotal");
        }


        String searchSQL = "";
        String sql = "SELECT * FROM " + table;
        if (individualSearch != "") {
            searchSQL = " where " + individualSearch;
        }
        sql += searchSQL;
        recordsFilteredSql += searchSQL;
        sql += " order by " + orderColumn + " " + orderDir;
        recordsFilteredSql += " order by " + orderColumn + " " + orderDir;
        sql += " limit " + start + ", " + length;

        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            users.add(new User(rs.getString("custom_num"),
                    rs.getString("custom_name"),
                    rs.getString("com_type"),
                    rs.getString("country"),
                    rs.getString("city"),
                    rs.getString("addr"),
                    rs.getString("email"),
                    rs.getString("phone")  )  );
        }

        if (searchValue != "") {
            rs = stmt.executeQuery(recordsFilteredSql);
            while (rs.next()) {
                recordsFiltered = rs.getString("recordsFiltered");
            }
        } else {
            recordsFiltered = recordsTotal;
        }
    }


    Map<Object, Object> info = new HashMap<Object, Object>();
    info.put("data", users);
    info.put("recordsTotal", recordsTotal);
    info.put("recordsFiltered", recordsFiltered);
    info.put("draw", draw);
    String json = new Gson().toJson(info);
    rs.close();
    stmt.close();
    conn.close();
    out.write(json);
%>

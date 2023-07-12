<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.cric.helper.CheckDate" %>
<%@ page import="org.javalite.activejdbc.Base" %>
<%@ page import="java.util.Date" %>
<%@ page import="app.model.Basic" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.*" %>
<html>
<body>
<%--<form action="">--%>
<%--    <input type="text" id="s" name="s" autofocus>--%>
<%--    <button type="submit">submit</button>--%>
<%--</form>--%>
<h2>
    <%//=request.getParameter("s")%>

    <%
        //기간설정 확인

        Base.open("java:comp/env/jdbc/mysql");

        try {
            int basicId = request.getParameter("id") == null ? 2 : Integer.parseInt(request.getParameter("id"));
            Basic Basic = app.model.Basic.findFirst("id = ?", basicId);

            int result = CheckDate.getPeriodState(2);

            Date date = new Date();
            LocalDateTime currentDate = LocalDateTime.now();
            final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            LocalDateTime started_at = LocalDateTime.parse(Basic.getTimestamp("started_at").toString().substring(0, 19), dateTimeFormatter);
            LocalDateTime ended_at = LocalDateTime.parse(Basic.getTimestamp("ended_at").toString().substring(0, 19), dateTimeFormatter);
            LocalDateTime now = LocalDateTime.now();

            out.println("now : " + now);
            out.println("<br>");
            out.println("LocalDateTime : " + currentDate);
            out.println("<br>");
            out.println("Date : " + date);
            out.println("<br>");
            out.println("basicId : " + basicId);
            out.println("<br>");
            out.println("Basic.started_at : " + started_at);
            out.println("<br>");
            out.println("Basic.ended_at : " + ended_at);
            out.println("<br>");
            out.println("dateTimeFormatter : " + currentDate.format(dateTimeFormatter));
            out.println("<br>");
            out.println("<br>");
            out.println("getPeriodState : " + result);
            out.println("<br>");
            //준비중
            if (!currentDate.isAfter(started_at)) {
                out.println("준비중");
            }
            //진행중
            if (currentDate.isAfter(started_at) && currentDate.isBefore(ended_at)) {
                out.println("진행중");
            }
            //마감
            if (currentDate.isAfter(ended_at)) {
                out.println("마감");
            }

        } catch (Exception e) {
            out.println(e);
        } finally {
            Base.close();
        }

    %>
</h2>
</body>
</html>

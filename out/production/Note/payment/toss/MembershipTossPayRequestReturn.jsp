<%@ page import="java.io.*, java.util.*,yongjeong.*, java.sql.*, javax.sql.*, javax.naming.*, juhan.kim.pe.*" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String result = request.getParameter("result");
    String usercode = request.getParameter("usercode");
    String _is_join = request.getParameter("_is_join");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        /* inis pay result page style */
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Noto Sans CJK KR', '맑은 고딕', 'Malgun Gothic', Gulim, sans-serif;
            font-size: 15px;
            color: #333;
            line-height: 1.5;
            background-color: #ffffff;
        }

        #wrap {
            width: 100%;
            margin: 0 auto;
        }

        #wrap .page {
            width: 768px;
            margin: 0 auto;
            padding: 50px 0 100px;
            box-shadow: 0 2px 7px rgba(0, 0, 0, 0.45);
            background-color: #fff;
            text-align: center;
        }

        .pay-result {
            width: 100%;
            margin: 0;
            padding: 10px 0;
            color: #fff;
            text-align: center;
            background-color: #4d4d4d;
        }

        .msg-pay {
            margin: 0 0 30px;
            text-align: center;
        }

        .tb-area {
            width: 480px;
            margin: 0 auto;
        }

        .tb-pay {
            width: 100%;
            margin: 0 0 30px;
            table-layout: fixed;
            border-collapse: collapse;
        }

        .tb-pay th {
            padding: 20px 10px;
            text-align: center;
            border: 1px solid #ccc;
            background-color: #f7f7f7;
        }

        .tb-pay td {
            padding: 20px 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        .btn-area {
            margin: 20px 0;
            text-align: center;
        }

        .btn-area a,
        .btn-area input {
            display: inline-block;
            width: 80px;
            height: 36px;
            line-height: 36px;
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            border: 1px solid #125aac;
            border-radius: 2px;
            background-color: #125aac;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div id="wrapper" class="wrapper">
    <!--// content-wrapper :e -->
    <div class="content-wrapper">
        <!-- Content :s -->
        <div class="content">
            <div class="pay-result">
                결제결과
            </div>

            <div class="page">
                <% if (result.equals("success")) {%>
                <script>
                    <%if(_is_join.equals("join_success")){%>
                    opener.location.href = '/user/?_0000_method=<%=_is_join%>&usercode=<%=usercode%>';
                    <%}else{%>
                    opener.location.reload();
                    <%}%>
                </script>
                <%
                        out.println("<div class=\"cardStatFrm\"><strong>결제가 정상적으로 이루어졌습니다.</strong></div>");
                        out.println("<div class=\"btn-area\"><input type=\"button\" value=\"닫기\" onclick=\"javascript:self.close()\"></div>");
                    } else {
                        out.println("<div class=\"cardStatFrm\"><strong>결제가 실패했습니다.</strong></div>");
                        out.println("<div class=\"btn-area\"><input type=\"button\" value=\"닫기\" onclick=\"javascript:opener.location.reload();self.close()\"></div>");
                    }
                %>
            </div>
        </div>
        <!-- Content :e -->
    </div>
    <!--// content-wrapper :e -->

</div>
</body>
</html>
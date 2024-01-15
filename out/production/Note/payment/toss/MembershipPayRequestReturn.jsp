<%@ page import="org.apache.http.HttpHeaders" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.collections.map.HashedMap" %>
<%@ page import="org.codehaus.jackson.map.ObjectMapper" %>
<%@ include file="../../include/inc_session.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: crew2022
  Date: 2023-04-20
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String orderId = request.getParameter("orderId");
    String paymentKey = request.getParameter("paymentKey");
    String amount = request.getParameter("amount");
    String resultString = request.getParameter("resultString");
    String compareOrderId = request.getParameter("compareOrderId");
    String comparePrice = request.getParameter("comparePrice");
    String _is_join = request.getParameter("_is_join");

    String[] extractionId = orderId.split("_");
    String aik_init = extractionId[0];
  %>
<form id="resultForm" method="post" action="/servlet/MembershipPayAcceptController">
    <input type="hidden" id="aik_init" name="aik_init" value="<%=aik_init%>">
    <input type="hidden" id="orderId" name="orderId" value="<%=orderId%>">
    <input type="hidden" id="paymentKey" name="paymentKey" value="<%=paymentKey%>">
    <input type="hidden" id="amount" name="amount" value="<%=amount%>">
    <input type="hidden" id="_is_join" name="_is_join" value="<%=_is_join%>">
    <input type="hidden" id="resultString" name="resultString" value="<%=resultString%>">
    <input type="hidden" id="compareOrderId" name="compareOrderId" value="<%=compareOrderId%>">
    <input type="hidden" id="comparePrice" name="comparePrice" value="<%=comparePrice%>">
    <input type="hidden" id="compareResult" name="compareResult" value="false">
    <input type="hidden" id="userAuth" name="userAuth" value="<%=UserAuth%>">
</form>
<script>
    var formId = document.getElementById("resultForm");
    var compareResult = document.getElementById("compareResult");
    if (<%=comparePrice.equals(amount) && compareOrderId.equals(orderId)%>) {
        compareResult.value ="true";
        formId.submit();
    } else {
        formId.submit();
    }
</script>



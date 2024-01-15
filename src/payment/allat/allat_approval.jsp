<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../include/inc_session.jsp" %>
<!-- 올앳관련 함수 Import //-->
<%@ page import="java.util.*,java.net.*,com.allat.util.AllatUtil" %>
<%@ page import="juhan.kim.pe.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<jsp:useBean id="af" scope="page" class="yongjeong.kiid_YongJeong_Func" />
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
            background-color: #767676;
        }

        #wrap {
            width: 100%;
            margin: 0 auto;
        }
        #wrap .page {
            width: 768px;
            margin: 0 auto;
            padding: 50px 0 100px;
            box-shadow: 0 2px 7px rgba(0,0,0,0.45);
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
<div id="wrap">

    <div class="pay-result">
        결제결과
    </div>

    <div class="page">
<%
    //Request Value Define
    //----------------------

    // Service Code
    String sCrossKey = "b0a1c138f539c4ddcb0f64c89ba1b489";	//설정필요 [사이트 참조 - http://www.allatpay.com/servlet/AllatBiz/support/sp_install_guide_scriptapi.jsp#shop]
    String sShopId   = "kicaspacer";		//설정필요
    String sAmount   = (String) session.getAttribute("total_fee");			//결제 금액을 다시 계산해서 만들어야 함(해킹방지)  ( session, DB 사용 )

    String sEncData  = request.getParameter("allat_enc_data");

    String strReq = "";

    // 요청 데이터 설정
    //----------------------
    strReq  ="allat_shop_id="   +sShopId;
    strReq +="&allat_amt="      +sAmount;
    strReq +="&allat_enc_data=" +sEncData;
    strReq +="&allat_cross_key="+sCrossKey;

    // 올앳 결제 서버와 통신  : AllatUtil.approvalReq->통신함수, HashMap->결과값
    //-----------------------------------------------------------------------------
    AllatUtil util = new AllatUtil();
    HashMap hm     = null;
    HashMap hm2     = null;
    //hm = util.approvalReq(strReq, "NOSSL");
    hm = util.approvalReq(strReq, "SSL");

    // 결제 결과 값 확인
    //------------------
    String sReplyCd     = (String)hm.get("reply_cd");
    String sReplyMsg    = (String)hm.get("reply_msg");

  /* 결과값 처리
  --------------------------------------------------------------------------
     결과 값이 '0000'이면 정상임. 단, allat_test_yn=Y 일경우 '0001'이 정상임.
     실제 결제   : allat_test_yn=N 일 경우 reply_cd=0000 이면 정상
     테스트 결제 : allat_test_yn=Y 일 경우 reply_cd=0001 이면 정상
  --------------------------------------------------------------------------*/
    //if( sReplyCd.equals("0000") ){
    if( sReplyCd.equals("0000") || sReplyCd.equals("0001") ){ //테스트용 allat_test_yn=Y
        // reply_cd "0000" 일때만 성공
        String sOrderNo        = (String)hm.get("order_no");
        String sAmt            = (String)hm.get("amt");
        String sPayType        = (String)hm.get("pay_type");
        String sApprovalYmdHms = (String)hm.get("approval_ymdhms");
        String sSeqNo          = (String)hm.get("seq_no");
        String sApprovalNo     = (String)hm.get("approval_no");
        String sCardId         = (String)hm.get("card_id");
        String sCardNm         = (String)hm.get("card_nm");
        String sSellMm         = (String)hm.get("sell_mm");
        String sZerofeeYn      = (String)hm.get("zerofee_yn");
        String sCertYn         = (String)hm.get("cert_yn");
        String sContractYn     = (String)hm.get("contract_yn");
        String sSaveAmt        = (String)hm.get("save_amt");
        String sBankId         = (String)hm.get("bank_id");
        String sBankNm         = (String)hm.get("bank_nm");
        String sCashBillNo     = (String)hm.get("cash_bill_no");
        String sCashApprovalNo = (String)hm.get("cash_approval_no");
        String sEscrowYn       = (String)hm.get("escrow_yn");
        String sAccountNo      = (String)hm.get("account_no");
        String sAccountNm      = (String)hm.get("account_nm");
        String sIncomeAccNm    = (String)hm.get("income_account_nm");
        String sIncomeLimitYmd = (String)hm.get("income_limit_ymd");
        String sIncomeExpectYmd= (String)hm.get("income_expect_ymd");
        String sCashYn         = (String)hm.get("cash_yn");
        String sHpId           = (String)hm.get("hp_id");
        String sTicketId       = (String)hm.get("ticket_id");
        String sTicketPayType  = (String)hm.get("ticket_pay_type");
        String sTicketNm       = (String)hm.get("ticket_nm");
        String sPointAmt       = (String)hm.get("point_amt");

        String treint="";
        String trenum="";
        String val="";
        String trect="";
        String meth = "";

        StringTokenizer tk1 = new StringTokenizer(sOrderNo,"|");

        String mode = "";
        String vcode = "";
        String ncode = "";
        String ucode = "";
        long inum = 0;
        long won = 0;
        int tkcnt = 0;
        String tmptk = "";
        StringTokenizer tk;


        String usercode = "";
        String username = "";
        String usersel = "";
        String pay_val = "";
        String tabname = "";
        String price_period ="0";
        String student_price ="0";

        tkcnt = tk1.countTokens();
        String tkcnts = tkcnt + "";

        if(sPayType.equals("ABANK")) {
            meth = "06";
        }else{
            meth = "01";
        }

        AikUtilDate aud =  new AikUtilDate();

        Boolean chkNextYearFee = false;
        String tmpdate = "";
        int curr_year = 0;
        int next_year = 0;
        String curr_mm = "";

        tmpdate = aud.DefaultDate();
        curr_year = Integer.parseInt(tmpdate.substring(0,4));
        curr_mm = tmpdate.substring(5,7);
        next_year = curr_year + 1;

        //-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//
        //  DB 연결 부분
        //  ConnectionPool 사용..
        Context initContext = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:comp/env");
        DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
        Connection DBCon = ds.getConnection();

        ResultSet Rs = null;
        Statement stmt = null;
        String sql = "";
        String aik_remark = "";

        // 결제 성공 DB 저장
        try {
            stmt = DBCon.createStatement();
            DBCon.setAutoCommit(false);
        %>
        <%@ include file="./_pay_approval.jsp" %>
        <%
            out.println("<div class=\"cardStatFrm\"><strong>결제가 정상적으로 이루어졌습니다.</strong></div>");
            out.println("<div class=\"btn-area\"><input type=\"button\" value=\"닫기\" onclick=\"javascript:opener.close();self.close()\"></div>");

        }
        catch(SQLException se) {
            DBCon.rollback();
            out.print(se);

            hm2 = util.cancelReq(strReq, "SSL");
            String sReplyCd2     = (String)hm2.get("reply_cd");
            if( sReplyCd2.equals("0000") || sReplyCd2.equals("0001") ) { //테스트용 allat_test_yn=Y}
                out.println("<div class=\"alert alert-danger\"><strong>DB저장 실패로 인해 결제가 취소 되었습니다.</strong></div>");
                out.println("<div class=\"text-center\"><a class=\"btn btn-primary btn-lg\" href=\"javascript:window.self.close()\"> 창닫기 </a></div>");
            }
            else{
                out.println("<div class=\"alert alert-danger\"><strong>결제가 취소되었습니다!!</strong></div>");
                out.println("<div class=\"text-center\"><a class=\"btn btn-primary btn-lg\" href=\"javascript:window.self.close()\"> 창닫기 </a></div>");
            }
        }
        finally {
            try {
                stmt.close();
                DBCon.close();
            }
            catch(SQLException se) {
            }
            stmt = null;
            DBCon = null;
        }

//        out.println("결과코드               : " + sReplyCd          + "<br>");
//        out.println("결과메세지             : " + sReplyMsg         + "<br>");
//        out.println("주문번호               : " + sOrderNo          + "<br>");
//        out.println("승인금액               : " + sAmt              + "<br>");
//        out.println("지불수단               : " + sPayType          + "<br>");
//        out.println("승인일시               : " + sApprovalYmdHms   + "<br>");
//        out.println("거래일련번호           : " + sSeqNo            + "<br>");
//        out.println("에스크로 적용 여부     : " + sEscrowYn         + "<br>");
//        out.println("==================== 신용 카드 ===================<br>");
//        out.println("승인번호               : " + sApprovalNo       + "<br>");
//        out.println("카드ID                 : " + sCardId           + "<br>");
//        out.println("카드명                 : " + sCardNm           + "<br>");
//        out.println("할부개월               : " + sSellMm           + "<br>");
//        out.println("무이자여부             : " + sZerofeeYn        + "<br>");   //무이자(Y),일시불(N)
//        out.println("인증여부               : " + sCertYn           + "<br>");   //인증(Y),미인증(N)
//        out.println("직가맹여부             : " + sContractYn       + "<br>");   //3자가맹점(Y),대표가맹점(N)
//        out.println("세이브 결제 금액       : " + sSaveAmt          + "<br>");
//        out.println("포인트 결제 금액       : " + sPointAmt         + "<br>");
//        out.println("=============== 계좌 이체 / 가상계좌 =============<br>");
//        out.println("은행ID                 : " + sBankId           + "<br>");
//        out.println("은행명                 : " + sBankNm           + "<br>");
//        out.println("현금영수증 일련 번호   : " + sCashBillNo       + "<br>");
//        out.println("현금영수증 승인 번호   : " + sCashApprovalNo   + "<br>");
//        out.println("===================== 가상계좌 ===================<br>");
//        out.println("계좌번호               : " + sAccountNo        + "<br>");
//        out.println("입금 계좌명            : " + sIncomeAccNm      + "<br>");
//        out.println("입금자명               : " + sAccountNm        + "<br>");
//        out.println("입금기한일             : " + sIncomeLimitYmd   + "<br>");
//        out.println("입금예정일             : " + sIncomeExpectYmd  + "<br>");
//        out.println("현금영수증신청 여부    : " + sCashYn           + "<br>");
//        out.println("===================== 휴대폰 결제 ================<br>");
//        out.println("이동통신사구분         : " + sHpId             + "<br>");
//        out.println("===================== 상품권 결제 ================<br>");
//        out.println("상품권ID               :" + sTicketId          + "<br>");
//        out.println("상품권 이름            :" + sTicketPayType     + "<br>");
//        out.println("결제구분               :" + sTicketNm          + "<br>");

        // 배포본에서는 제외 시킬것 //////////////////////////////////////////
//        String sPartcancelYn  = (String)hm.get("partcancel_yn");
//        String sBCCertNo      = (String)hm.get("bc_cert_no");
//        String sCardNo        = (String)hm.get("card_no");
//        String sIspFullCardCd = (String)hm.get("isp_full_card_cd");
//        String sCardType      = (String)hm.get("card_type");
//        String sBankAccountNm = (String)hm.get("bank_account_nm");
//        out.println("===================== 배포본제외 ================<br>");
//        out.println("신용카드 부분취소가능여부 : " + sPartcancelYn  + "<br>");
//        out.println("BC인증번호                : " + sBCCertNo      + "<br>");
//        out.println("카드번호 Return           : " + sCardNo        + "<br>");
//        out.println("ISP 전체 카드코드         : " + sIspFullCardCd + "<br>");
//        out.println("카드구분                  : " + sCardType      + "<br>");
//        out.println("계좌이체 예금주명         : " + sBankAccountNm + "<br>");
        //////////////////////////////////////////////////////////////////////

    }else{
        // reply_cd 가 "0000" 아닐때는 에러 (자세한 내용은 매뉴얼참조)
        // reply_msg 가 실패에 대한 메세지
        // 결제 실패 메세지
        out.println("결과코드               : " + sReplyCd  + "<br>");
        out.println("결과메세지             : " + sReplyMsg + "<br>");
        out.println("<div class=\"cardStatFrm\"><strong>결제가 실패했습니다.</strong></div>");
        out.println("<div class=\"btn-area\"><input type=\"button\" value=\"닫기\" onclick=\"javascript:opener.location.reload();self.close()\"></div>");
    }
%>
    </div>
    <!-- tb-area -->
</div>
<!-- page -->
</div>
</body>
</html>
<%--
    [신용카드 전표출력 예제]

    결제가 정상적으로 완료되면 아래의 소스를 이용하여, 고객에게 신용카드 전표를 보여줄 수 있습니다.
    전표 출력시 상점아이디와 주문번호를 설정하시기 바랍니다.

    var urls ="http://www.allatpay.com/servlet/AllatBizPop/member/pop_card_receipt.jsp?shop_id=상점아이디&order_no=주문번호";
    window.open(urls,"app","width=410,height=650,scrollbars=0");

    현금영수증 전표 또는 거래확인서 출력에 대한 문의는 올앳페이 사이트의 1:1상담을 이용하시거나
    02) 3788-9990 으로 전화 주시기 바랍니다.

    전표출력 페이지는 저희 올앳 홈페이지의 일부로써, 홈페이지 개편 등의 이유로 인하여 페이지 변경 또는 URL 변경이 있을 수
    있습니다. 홈페이지 개편에 관한 공지가 있을 경우, 전표출력 URL을 확인하시기 바랍니다.
--%>

<%@ page pageEncoding="UTF-8" import="java.util.*" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../include/inc_session.jsp" %>
<jsp:useBean id="af" scope="page" class="yongjeong.kiid_YongJeong_Func" />
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%!
	public String StringReplace(String content, String targettxt, String changetxt)
	{
		StringBuffer sb;
		sb = new StringBuffer(content);

		while(true)
		{
			if (sb.indexOf(targettxt) > -1)
			{
				sb.replace(sb.indexOf(targettxt), sb.indexOf(targettxt)+targettxt.length(), changetxt);
			}else
			{
				break;
			}
		}
		content = sb.toString();
		sb = null;
		return content;
	}
%>
<%
	response.setHeader("cache-control","no-cache");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");

	long inum = 0;
	long won = 0;
	String mode = "";
	String vcode = "";
	String ncode = "";
	String wow_year = "";
	String payname = "";
	String paynames = "";
	String pay_val = "";
	String[] sss;
	StringTokenizer tk ;

	long usercode = (request.getParameter("usercode")==null)?0:Long.parseLong(request.getParameter("usercode"));
	String username = (request.getParameter("username")==null)?"":request.getParameter("username");
	String usersel = (request.getParameter("usersel")==null)?"":request.getParameter("usersel");
	String userEmail = (request.getParameter("userEmail")==null)?"":request.getParameter("userEmail");
	sss = request.getParameterValues("checkval");

	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
	String siteDomain = baseURL+"payment/user"; //가맹점 도메인 입력
//	try {
%>
<!-- 가맹점 URL이 http일 경우 http처리, 실제 오픈시 가맹점 MID로 stdpay로 처리 -->
<script language=JavaScript charset='euc-kr' src="https://tx.allatpay.com/common/NonAllatPayRE.js"></script>
<script language=Javascript>
	// 결제페이지 호출
	function ftn_approval(dfm) {
		AllatPay_Approval(dfm);
		// 결제창 자동종료 체크 시작
		AllatPay_Closechk_Start();
	}

	// 결과값 반환( receive 페이지에서 호출 )
	function result_submit(result_cd,result_msg,enc_data) {

		// 결제창 자동종료 체크 종료
		AllatPay_Closechk_End();

		if( result_cd != '0000' ){
			window.setTimeout(function(){alert(result_cd + " : " + result_msg);},1000);
		} else {
			fm.allat_enc_data.value = enc_data;

			fm.action = "./allat_approval.jsp";
			fm.method = "post";
			fm.target = "_self";
			fm.submit();
		}
	}

    //ADDED START
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
    }
    //ADDED END

</script>

<!-- #pop_wrap :s -->
<div id="pop_wrap">

	<!-- #pop_header :s -->
	<div id="pop_header">
		<h1><i class="fa fa-check-square-o mg-r5"></i> 회비납부</h1>
	</div>
	<!-- #pop_header :e -->

	<!-- #pop_container :s -->
	<div id="pop_container">
		<div class="innerWrap">

			<!-- #pop_contents :s -->
			<div id="pop_contents">

				<div class="alert alert-danger" id="notice_chrome" style="display: none">
					<p>Chrome 브라우저의 신규 보안정책으로 결제가 실패 할 수 있습니다. </p>
					<p>결제가 실패하시면 타 브라우저( Internet Explorer(IE), firefox, safari 등)를 통한 결제 이용을 안내 드리오며 양해 부탁드립니다.</p>
				</div>

				<script>
                    function getChromeVersion() {
                        var raw = navigator.userAgent.match(/Chrom(e|ium)\/([0-9]+)\./);
                        return raw ? parseInt(raw[2], 10) : false;
                    }

                    if(getChromeVersion()>=80){
                        document.getElementById("notice_chrome").style.display="block";
                    }
				</script>

					<table class="table table-bordered tb-join mg-b30">
						<caption>납부내역</caption>
						<col class="w20">
						<col class="w45">
						<col class="w35">

						<thead>
						<tr>
							<th class="ta-center">No.</th>
							<th>회비종류</th>
							<th class="ta-right">금액</th>
						</tr>
						</thead>
						<tbody>
						<%
							int ii = 0;
							long tot_won = 0;
							String vname = "";
							String nname = "";
							String temp = "";

							for(int i=0;i<sss.length;i++) {
								ii= i + 1;
//			temp = af.JSP_eng2han(sss[i]);
								temp = af.eng2han(sss[i]);

								tk = new StringTokenizer(temp, ";");
								mode = tk.nextToken();
								if(mode.equals("previousMembershipFee")){
									won = Long.parseLong(tk.nextToken());
								}else{
									inum = Long.parseLong(tk.nextToken());
									won = Long.parseLong(tk.nextToken());
								}

								vcode = tk.nextToken();

								usersel = tk.nextToken();
								tot_won += won;

								vname = af.getCodeName(vcode,"27");

								paynames += vname + ", ";
								if(mode.equals("previousMembershipFee")) {
									pay_val += mode + ";" ;
									pay_val += won + ";" ;

								}else{
									pay_val += mode + ";" ;
									pay_val += inum + ";" ;
									pay_val += usersel ;
								}


									if(mode.equals("n")){
										pay_val += ";" + tk.nextToken();
										pay_val += ";" + tk.nextToken();
									}
									else if(mode.equals("student")){
										pay_val += ";" + tk.nextToken();
										pay_val += ";" + won;
									}
									else if(mode.equals("trans_s_to_r")){
										pay_val += ";" + vcode; //회비코드
										pay_val += ";" + tk.nextToken(); //회원코드
										pay_val += ";" + won;
									}
									else if(mode.equals("trans_s_to_f")){
										pay_val += ";" + vcode; //회비코드
										pay_val += ";" + tk.nextToken(); //회원코드
										pay_val += ";" + won;
									}
								pay_val += "|";
						%>
						<tr>
							<td class="ta-center"><%=ii%><input type="hidden" name="checkval" value="<%=temp%>"></td>
							<td><%=vname%></td>
							<td class="ta-right"><%=won%></td>
						</tr>
						<%
							}

							if(!paynames.equals("")) {
								paynames = paynames.substring(0,paynames.length()-2);
							}
							pay_val = StringReplace(pay_val,",","·");
						%>
						<tr>
							<th class="ta-center highlight-blue">합계</th>
							<td class="ta-right highlight-blue" colspan="2"><%=tot_won%></td>
						</tr>
						</tbody>
					</table>
				<form name="fm"  method=POST action="./allat_approval.jsp">
					<%
						if(UserNum.equals("0") && request.getParameter("usersel").equals("2")){
							UserName = af.eng2han(request.getParameter("username"));
							UserNum = request.getParameter("usercode");
						}

						session.setAttribute("total_fee", tot_won+"");
					%>
					<input type="hidden" name="allat_shop_id" value="kicaspacer">
					<input type="hidden" name="allat_order_no" value="<%=pay_val%>">
					<input type="hidden" name="allat_amt" value="<%=tot_won%>">
					<input type="hidden" name="allat_pmember_id" value="<%=UserNum%>">
					<input type="hidden" name="allat_product_cd" value="<%=paynames%>">
					<input type="hidden" name="allat_product_nm" value="<%=paynames%>">
					<input type="hidden" name="allat_buyer_nm" value="<%=UserName%>">
					<input type="hidden" name="allat_recp_nm" value="<%=UserName%>">
					<input type="hidden" name="allat_recp_addr" value="서울특별시 서초구 효령로 87 (방배동 917-9) 건축센터 204호">
					<input type="hidden" name="shop_receive_url" value="<%=siteDomain%>/allat_approval.jsp">
					<input type="hidden" name=allat_enc_data value=''>
					<input type="hidden" name=allat_encode_type value='U'>
					<input type="hidden" name="allat_card_yn" value="Y">
					<input type="hidden" name="allat_bank_yn" value="Y">
					<input type="hidden" name="allat_vbank_yn" value="N">
					<input type="hidden" name="allat_email_addr" value="<%=userEmail%>">
					<input type="hidden" name="allat_tax_yn" value="N">
					<input type="hidden" name="allat_test_yn" value="Y">
					<%--<input type="hidden" name="allat_merchantData" value="<%=pay_val%>">--%>

				</form>
				<table class="table table-bordered tb-join mg-b30">
					<caption>납부방법 선택</caption>

					<td class="ta-center">
						<input class="btn btn-primary mg-r10" type="button" name="btn_card_pay" value="신용카드" onclick="javascript:ftn_approval(document.fm);document.getElementById('vbank').style.display='none';">
						<input class="btn btn-primary mg-r10" type="button" name="btn_card_pay" value="무통장입금" onclick="javascript:document.getElementById('vbank').style.display='block';">
						<div id="vbank" class="mg-t20" style="display: none;">
							<fieldset>
								<legend>무통장입금 정보</legend><br>
								<form id="pay_registration" action="/servlet/Kiid_User_Due" method="post" onSubmit="return Checkform_vbank(this)">
									<input type="hidden" name="_0000_method" value="vbank">
									<input type="hidden" name="s_0018_aik_wow_meth" value="03">
									<input type="hidden" name="_0000_pay_value" value="<%=pay_val%>">
									<input type="hidden" name="_0000_aik_returl" value="/user/?_0000_method=join_success&usercode=<%=usercode%>">
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label class="control-label" for="will_be_paid_at">입금 예정일</label>
												<input class="form-control" name="aik_will_be_paid_at" id="will_be_paid_at" type="date" placeholder="YYYY-MM-DD">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label class="control-label" for="depositor">입금자명</label>
												<input class="form-control" name="aik_remmiter" id="depositor" type="text">
											</div>
										</div>
									</div>
									<input class="btn btn-primary" type="submit" value="입력">
								</form>
							</fieldset>
						</div>
					</td>
				</table>
				<div style="text-align:center;">
					<input class="btn btn-default btn-sm mg-r10" type="button" name="btn_card_pay" value="취소" onclick="javascript:window.close()">
				</div>
			</div>
			<!-- #pop_contents :e -->

		</div>
	</div>
	<!-- #pop_container :e -->

</div>
<!-- #pop_wrap :e -->





<%
	/*
        }
        catch(SQLException se) {
            out.println(se);
        }
        finally {
            try {
                stmt.close();
                stmt2.close();
                DBCon.close();
            }
            catch(SQLException se) {
                out.println("DBClose Error");
            }
            stmt = null;
            DBCon = null;
        }

    */
%>
<% response.flushBuffer(); %>

<%@ page import="java.util.Date, java.sql.*, javax.sql.*, javax.naming.*,java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<jsp:useBean id="aud" scope="page" class="juhan.kim.pe.AikUtilDate" />
<jsp:useBean id="af" scope="page" class="yongjeong.kiid_YongJeong_Func" />
<%
	response.setHeader("cache-control","no-cache");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>
<%@ include file="../include/inc_config.jsp" %>
<%@ include file="../include/inc_session.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<!-- include - headinfo :s -->
	<%@ include file="/submission/include/frm_include/inc_headinfo.jsp" %>
	<!-- include - headinfo :e -->

	<!-- include - script :s -->
	<%@ include file="/submission/include/frm_include/inc_scripts.jsp" %>
	<!-- include - script :e -->

	<script>
		function textCounter(field, countfield, maxlimit) {
			if (field.value.length > maxlimit) // if too long...trim it!
			{
				alert("maximum " + maxlimit + " characters");
				field.value = field.value.substring(0, maxlimit);
			}
			else
			{
				countfield.value = maxlimit - field.value.length;
			}
		}

		function textCounter2(field, countfield) {
			countfield.value = field.value.length;
		}

		$(function() {
			$('.btn-pop').click(function() {
				var pop_status;
				pop_status = window.open("./pop_classified.jsp","POP_CLASSIFIED","width=640, height=700, top=0, left=0,scrollbars=yes");
				pop_status.focus();
			});
		});
	</script>
	<%
		if (UserID.equals("")) {
			out.println("<meta http-equiv='Refresh' content='0; URL=/submission/login.jsp>");
		}
		else {

			Connection DBCon = null;
			ResultSet Rs = null;
			ResultSet Rs1 = null;
			Statement stmt = null;
			Statement stmt1 = null;

			String SQL = "";
			String num = request.getParameter("num");
			//out.println("num : "+num);
			String jobName = "";
			String filetype = "";
			try{
				//          Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");

				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:comp/env");
				DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
				DBCon = ds.getConnection();
				stmt = DBCon.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				stmt1 = DBCon.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY*/);
				//          DBCon.setAutoCommit(false);
			}catch(Exception cfe)
			{
				//          out.println("클래스가 없습니다");
			}/*catch(SQLException se)
		      {
		          out.println(se);
		      }*/
			//	  String UserName = (String)session.getAttribute("UserName") ;
			//	  String UserNum = (String)session.getAttribute("UserNum");

			String tmpdate = aud.DefaultDate();
			int curr_yy = Integer.parseInt(tmpdate.substring(0,4));
			String curr_mm = tmpdate.substring(5,7);

			try{

				SQL = "select  B.aik_cls_subclass_name from chost_tre_0011 A, chost_cls_0002 B where A.aik_tre_id = '" + num + "' and A.aik_tre_paper_filetype = B.aik_cls_subclass_code and B.aik_cls_class_value = '12'";
				Rs = stmt.executeQuery(SQL);
				Rs.next();
				//filetype = Rs.getString("aik_cls_subclass_name").toString().toLowerCase();
				Rs.close();

				filetype = "(pdf)";
				//out.print(filetype);
	%>
</head>

<body>
<!-- wrapper :s -->
<div class="wrapper">

	<!--// content-wrapper :e -->
	<div class="content-wrapper">

		<!-- Content :s -->
		<div class="content">

			<!-- 논문투고정보 :s -->
			<div class="box">
				<div class="box-body">
					<form name="frm" method="post" enctype="multipart/form-data" onSubmit="return sendfrm()">
						<input type="hidden" value="<%=num%>" name="s_0021_aik_tre_id">
						<input type="hidden" value="<%=UserNum%>" name="s_0021_aik_user_code">
						<input type="hidden" value="<%=UserID%>" name="s_0021_email">

						<div class="table-responsive">
							<div class="text-right"><span class="text-danger">* <%=lang.equals("ko")?"필수":"Required"%></span> </div>
							<table class="table table-bordered tb-info">
								<col class="w20">
								<col class="w80">

								<tbody>
								<tr><!-- 일반/긴급 -->
									<th><%=au_tre_sub_view_text3 %> <span class="text-danger">*</span></th>
									<td class="ta-left">
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_express' id="sub_express01" value="01" checked >
											<%=af.getCodeName("01","26", lang)%>&nbsp;
											(￦<span id="sub_express01_fee"><%=NumberFormat.getIntegerInstance().format(af.getPayWon("11", tmpdate))%></span>)
										</label>
<%--										<label class="radio-inline">--%>
<%--											<input type='radio' name='s_0021_aik_sub_express' id="sub_express02" value="02" >--%>
<%--											<%=af.getCodeName("02","26", lang)%>&nbsp;--%>
<%--											(￦<%=NumberFormat.getIntegerInstance().format(af.getPayWon("12", tmpdate))%>)--%>
<%--										</label>--%>
									</td>
								</tr>
								<tr><!-- 논문분류 -->
									<th>원고구분 <span class="text-danger">*</span></th>
									<td class="ta-left">
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_category' id="sub_category01" value="연구논문" checked > 연구논문
										</label>
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_category' id="sub_category02" value="총설" > 총설
										</label>
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_category' id="sub_category03" value="기술노트" > 기술노트
										</label>
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_category' id="sub_category04" value="특별기고" > 특별기고
										</label>
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_category' id="sub_category05" value="토의" > 토의
										</label>
										<label class="radio-inline">
											<input type='radio' name='s_0021_aik_sub_category' id="sub_category06" value="기타" > 기타
										</label>

									</td>
								</tr>
								<tr><!-- 세부분야 -->
									<th><%=j_category%> <span class="text-danger">*</span></th>
									<td class="ta-left form-inline">

										<div class="form-group">
											<div class="form-list">
												<select class="form-control input-sm" name='s_0021_aik_cls_subclass_id' onchange="javascript:paravalue1(this.value,'s_0021_aik_cls_subclass_id2')">
													<option value="">-<%=au_ins_tre_post_text9 %>-</option>
													<%

														if(lang.equals("ko"))
														{
															SQL = "select B.aik_cls_subclass_code, B.aik_cls_subclass_name ";
															SQL += "from  chost_tre_0012 A, chost_cls_0002 B ";
															SQL += "where A.aik_cls_subclass_id = B.aik_cls_subclass_id ";
															SQL += "and A.aik_tre_id = " + num + " order by B.aik_cls_subclass_id asc";
														}
														else
														{
															SQL = "select B.aik_cls_subclass_code, B.aik_code_ename as aik_cls_subclass_name ";
															SQL += "from  chost_tre_0012 A, chost_cls_0002 B ";
															SQL += "where A.aik_cls_subclass_id = B.aik_cls_subclass_id ";
															SQL += "and A.aik_tre_id = " + num + " order by B.aik_cls_subclass_id asc";
														}


														Rs = stmt.executeQuery(SQL);

														while(Rs.next()){
													%>
													<option value="<%=Rs.getString("aik_cls_subclass_code").trim()%>"><%=Rs.getString("aik_cls_subclass_name").trim()%></option>
													<%
															//out.println("<input type='radio' value='"+Rs.getString("aik_cls_subclass_id").trim()+"' name='s_0021_aik_cls_subclass_id' >"+Rs.getString("aik_cls_subclass_name").trim()+"&nbsp;");
														}
														Rs.close();
													%>
												</select>
												<select class="form-control input-sm" name='s_0021_aik_cls_subclass_id2'>
													<option value="">-<%=au_ins_tre_post_text10 %>-</option>
												</select>
											</div>
										</div>
									</td>
								</tr>

								<tr><!-- 제목 -->
									<th><%=HD_TITLE %> </th>
									<td class="ta-left">
										<div class="form-group">
											<label for="s_0021_aik_sub_htitle"><%=au_ins_tre_post_text2 %></label> <span class="text-danger">*</span>
											<input class="form-control input-sm" type="text" id="s_0021_aik_sub_htitle" name="s_0021_aik_sub_htitle" maxlength="255">
										</div>
										<div class="form-group">
											<label for="s_0021_aik_sub_etitle"><%=au_ins_tre_post_text3 %></label> <span class="text-danger">*</span>
											<input class="form-control input-sm" type="text" id="s_0021_aik_sub_etitle" name="s_0021_aik_sub_etitle" maxlength="255" onkeydown="clearHangulInput(event)" onkeyup="clearHangulInput(event)">
										</div>
									</td>
								</tr>
								<tr><!-- 투고자 -->
									<th><%=au_ins_tre_post_text4 %> <span class="text-danger">*</span></th>
									<td class="ta-left">
										<span class="_txt"><b><%=HD_NAME %> :</b> <%=UserName%></span>
										<%--<span class="_txt"><b><%=au_ins_tre_post_text5 %> :</b> <%=UserNum%></span>--%>
										<%--<span class="_txt"><b><%=au_ins_tre_post_text6 %> :</b> <%=jobName%></span>--%>
									</td>
								</tr>

								<input type="hidden" name="s_0021_aik_corr_code" value="0">
								<tr><!-- 공동저자 -->
									<th><%=LABEL_AUTHOR %> <span class="text-danger">*</span>
										<div class="text-primary">- 회원(개인 및 학생)의 경우 검색으로 입력</div>
										<div class="text-primary">- 비회원인 경우 성명, 소속, Email 직접 입력</div>
										<div class="text-primary">- 논문표기 순으로 작성</div>

									</th>
									<td class="ta-left">
										<div class="input_fields_wrap">
											<div class="form-list">
												<input class="form-control element-inline input-sm" type="hidden" name="_0000_aik_coauthor_name">
												<input class="form-control element-inline input-sm" type="hidden" name="_0000_aik_coauthor_aff">
												<input class="form-control element-inline input-sm" type="hidden" name="_0000_aik_coauthor_tel">
												<input class="form-control element-inline input-sm" type="hidden" name="_0000_aik_coauthor_gubun">
												<input type="hidden" name="_0000_aik_coauthor_usercode" value="0">

												<input class="form-control element-inline input-sm" type="text" name="_0000_aik_coauthor_name" value="<%="이름"%>" placeholder="<%=HD_NAME %>" readonly>
												<input class="form-control element-inline input-sm" type="text" name="_0000_aik_coauthor_aff"  value="<%="소속"%>" placeholder="<%=au_ins_tre_post_text6 %>" readonly>
												<input class="form-control element-inline input-sm" type="text" name="_0000_aik_coauthor_tel"  value="<%="이메일"%>" placeholder="<%=j_email %>" readonly>
												<select class="form-control element-inline input-sm coauthor_gubun" name='_0000_aik_coauthor_gubun' >
													<option value="1">주저자</option>
													<option value="2">주저자&교신저자</option>
												</select>
<%--												<input type="button" class="btn btn-primary find-member" value="<%=au_pubcret_text7%>">--%>
												<input type="hidden" name="_0000_aik_coauthor_usercode" value="<%="usercode"%>>">
											</div>
										</div>
										<button class="add_field_button"><i class="ion-plus-round"></i></button>
										<div class="text-red">※ 저자중 50%이상이 정회원일 경우에만 투고가 가능합니다.</div>
										<div class="text-red">※ 투고시에 입력한 저자 정보를 추후 수정시 변경사유서를 제출하여야 하오니 신중히 입력바랍니다.</div>

									</td>
								</tr>

								<input type='hidden' name='s_0021_language' value="ko">


								<tr><!-- 키워드 -->
									<th><%=au_ins_tre_post_text12 %>(<%=au_ins_tre_post_text3%>)
									</th>
									<td class="ta-left">
<%--										<div class="form-group">--%>
<%--											<label for="s_0021_aik_sub_hkeyword"><%=au_ins_tre_post_text2 %></label> <span class="text-danger">*</span>--%>
<%--											<input class="form-control input-sm" type="text" id="s_0021_aik_sub_hkeyword" name="s_0021_aik_sub_hkeyword" maxlength="150">--%>
<%--										</div>--%>
										<div class="form-group">
											<input class="form-control input-sm" type="text" id="s_0021_aik_sub_ekeyword" name="s_0021_aik_sub_ekeyword" maxlength="150">
										</div>
										<p class="text-red">※ 알파벳순으로 4~6개를 입력 <br>&nbsp;&nbsp;&nbsp;Ex) 키워드1, 키워드2...(단어와 단어사이 "," 로 구분)</p>
									</td>
								</tr>

								<%--								<tr><!-- 추천심사위원 -->--%>
								<%--									<th><%=au_ins_tre_post_text22 %></th>--%>
								<%--									<td class="ta-left">--%>
								<%--										<div class="form-group">--%>
								<%--											<div class="form-list">--%>
								<%--												<table class="table table-bordered table-striped">--%>
								<%--													<thead>--%>
								<%--													<tr>--%>
								<%--														<th>&nbsp;</th>--%>
								<%--														<th class="text-center"><%=HD_NAME%></th>--%>
								<%--														<th class="text-center"><%=au_ins_tre_post_text6%></th>--%>
								<%--													</tr>--%>
								<%--													</thead>--%>
								<%--													<tbody>--%>
								<%--													<tr>--%>
								<%--														<th scope="row" class="text-center"><%=au_ins_tre_post_text22 %>1</th>--%>
								<%--														<td><input name="s_0021_reco_reviewer_nm1" type="text" class="form-control input-sm"/></td>--%>
								<%--														<td><input name="s_0021_reco_reviewer_sosok1" type="text" class="form-control input-sm"/></td>--%>
								<%--													</tr>--%>
								<%--													<tr>--%>
								<%--														<th scope="row" class="text-center"><%=au_ins_tre_post_text22 %>2</th>--%>
								<%--														<td><input name="s_0021_reco_reviewer_nm2" type="text" class="form-control input-sm"/></td>--%>
								<%--														<td><input name="s_0021_reco_reviewer_sosok2" type="text" class="form-control input-sm"/></td>--%>
								<%--													</tr>--%>
								<%--													<tr>--%>
								<%--														<th scope="row" class="text-center"><%=au_ins_tre_post_text22 %>3</th>--%>
								<%--														<td><input name="s_0021_reco_reviewer_nm3" type="text" class="form-control input-sm"/></td>--%>
								<%--														<td><input name="s_0021_reco_reviewer_sosok3" type="text" class="form-control input-sm"/></td>--%>
								<%--													</tr>--%>
								<%--													</tbody>--%>
								<%--												</table>--%>
								<%--											</div>--%>
								<%--											<p class="text-primary">※ 추천심사위원은 편집위원이 심사위원 선정시 참고만 하는 사항입니다.</p>--%>
								<%--										</div>--%>
								<%--									</td>--%>
								<%--								</tr>--%>
<%--								<tr><!-- 국문초록 -->--%>
<%--									<th><%=au_ins_tre_post_text13 %> <span class="text-danger">*</span>&lt;%&ndash;<br>(<%=au_ins_tre_post_text151 %>)&ndash;%&gt;</th>--%>
<%--									<td class="ta-left">--%>
<%--										<div class="form-group">--%>
<%--											<textarea class="form-control input-sm" rows="15" name="s_0021_aik_sub_hcontent" onKeyDown="textCounter2(this.form.s_0021_aik_sub_hcontent,this.form._0000_remLenh);" onKeyUp="textCounter2(this.form.s_0021_aik_sub_hcontent,this.form._0000_remLenh);"></textarea>--%>
<%--										</div>--%>
<%--										<div class="form-group form-inline">--%>
<%--											<input class="form-control input-sm" readonly type=text name="_0000_remLenh" size=3 maxlength=3 value="0"> <%//=au_ins_tre_post_text161 %>--%>
<%--										</div>--%>
<%--									</td>--%>
<%--								</tr>--%>

								<tr><!-- 영문초록 -->
									<th><%=au_ins_tre_post_text14 %> <span class="text-danger">*</span><%--<br>(<%=au_ins_tre_post_text15 %>)--%></th>
									<td class="ta-left">
										<div class="form-group">
											<textarea class="form-control input-sm" rows="15" name="s_0021_aik_sub_econtent"  wrap="virtual" onKeyDown="javascript:document.frm._0000_remLene.value=countWords(this.value);" onKeyUp="javascript:document.frm._0000_remLene.value=countWords(this.value);"></textarea>
										</div>
										<div class="form-group form-inline">
											<input class="form-control input-sm" readonly type=text name="_0000_remLene" size=3 maxlength=3 value="0"> <%//=au_ins_tre_post_text16 %>
										</div>
										<p class="text-red">※ 200-250 단어 범위의 분량이 되도록 한 문단(one paragraph)으로 작성</p>
									</td>
								</tr>

								<tr><!-- 심사본 파일 -->
									<th><%=au_ins_tre_post_text17 %> <span class="text-danger">*</span></th>
									<td class="ta-left">
										<a style="margin-right:20px;" href="/download/pages_jkswe/submission/submission_file_02(Manuscript File).hwp" download="심사용 논문파일 샘플.hwp">심사용논문파일 다운로드(HWP) </a>

										<div class="form-group">
											<input type="file" name="upfile" id="upfile">
											<p class="text-danger"> <b><%="doc, docx, hwp, hwpx"%></b> (25Mb 이하)</p>

										</div>
										<div>
											<div class="text-red">* 주의: 아래 사항을 준수하지 않을 시 접수가 거부될 수 있습니다.</div>
											<div class="text-red">* 저자명, 소속, 사사 등 저자의 정보(기재불가)를 확인할 수 있는 항목이 기재되어 있는지 다시 한번 확인해 주시기 바랍니다.</div>
											<div class="text-red">* 논문의 구성이 투고규정에 제시한 순서에 따랐는지 확인해 주시기 바랍니다.</div>
											<div class="text-red">예) 1.서론 2.연구방법 3.결과및고찰 4.결론</div>
										</div>
									</td>
								</tr>

								<tr>
									<th><%=lang.equals("ko")?"표지파일첨부(제출용)":"Cover file(for submission)"%> <span class="text-danger">*</span></th>
									<td class="ta-left">
										<div class="form-group">
<%--											<a class="" href="javascript:alert('준비 중 입니다.');" download="2.논문제출서 저작권 윤리규정서약서 200601.hwp">저작재산권양도확인서+연구윤리규정준수서약서(HWP)</a>--%>
												<a class="" href="/download/pages_jkswe/submission/submission_file_01(Cover file).hwp" download="">예시파일 다운로드</a>
											<input type="file" name="upfile2" id="upfile2">
											<p class="text-danger"> <b><%="doc, docx, hwp, hwpx"%></b> (25Mb 이하)</p>
											<p class="text-danger">※ 제목, 저자, 소속의 국문과 영문으로 기재하여 주시기 바랍니다.</p>
										</div>
									</td>
								</tr>
								<tr>
									<th><%=lang.equals("ko")?"추가파일첨부":"additional files"%></th>
									<td class="ta-left">
										<div class="form-group">
											<input type="file" name="upfile3" id="upfile3">
											<p class="text-danger"> <b><%="jpg,pdf"%></b> </p>
										</div>
									</td>
								</tr>

								</tbody>
							</table>
						</div><!-- // table -->

						<div class="btn-area"><!-- button area -->

							<input type="submit" class="btn bg-primary btn-flat margin" value="<%=au_ins_tre_post_text18 %>" name="b1" id="submitbtn">

							<input type="hidden" name="_0000_pubcode_1">
							<input type="hidden" name="_0000_pubcode_2">
						</div><!-- // button area -->

					</form>

					<script>

						function isEmpty(str){

							if(typeof str == "undefined" || str == null || str == "")
								return true;
							else
								return false ;
						}

						function sendfrm() {

							if(frm.s_0021_aik_cls_subclass_id.value.length == 0){
								alert("<%=au_ins_tre_post_msg5%>");
								return false;
							}
							if(frm.s_0021_aik_cls_subclass_id2.value.length == 0){
								alert("<%=au_ins_tre_post_msg5%>");
								return false;
							}

							if(frm.s_0021_aik_sub_htitle.value.length == 0){
								alert("<%=au_ins_tre_post_msg3%>");
								frm.s_0021_aik_sub_htitle.focus();
								return false;
							}
							if(frm.s_0021_aik_sub_etitle.value.length == 0){
								alert("<%=au_ins_tre_post_msg4%>");
								frm.s_0021_aik_sub_etitle.focus();
								return false;
							}

							const hangulRegex = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;

							if(hangulRegex.test(frm.s_0021_aik_sub_etitle.value)){
								alert("영문 제목에는 영어만 입력해 주세요.");
								frm.s_0021_aik_sub_etitle.focus();
								return false;
							}

							if(document.frm._0000_aik_coauthor_name[1].value==""){
								alert("주저자를 회원검색해 주세요.");
								document.frm._0000_aik_coauthor_name[1].focus();
								return false;
							}
							if(document.frm._0000_aik_coauthor_aff[1].value==""){
								alert("주저자 소속 및 직위 정보를 입력해 주세요.");
								return false;
							}
							if(document.frm._0000_aik_coauthor_tel[1].value==""){
								alert("주저자 이메일정보를 입력해 주세요.");
								return false;
							}

							for(corr=1;corr < document.frm._0000_aik_coauthor_name.length;corr++){
								if(document.frm._0000_aik_coauthor_name[corr].value==""){
									alert("제"+corr+"저자를 회원검색해 주세요.");
									document.frm._0000_aik_coauthor_name[corr].focus();
									return false;
								}
								if(document.frm._0000_aik_coauthor_aff[corr].value==""){
									alert("제"+corr+"저자 소속 및 직위 정보를 입력해 주세요.");
									document.frm._0000_aik_coauthor_aff[corr].focus();
									return false;
								}
							}

							var corr_author=0;
							for(corr=1;corr < document.frm._0000_aik_coauthor_name.length;corr++){
								if(document.frm._0000_aik_coauthor_gubun[corr].value=="2" || document.frm._0000_aik_coauthor_gubun[corr].value=="3") //교신저자는 1명만
								{
									corr_author++;
								}
							}

							if(corr_author==0)
							{
								alert("교신저자를 선택해 주세요.");
								return false;
							}
							else if(corr_author>1)
							{
								alert("교신저자는 한명만 선택해 주세요.");
								return false;
							}

							let usercodes = document.getElementsByName("_0000_aik_coauthor_usercode");
							let authorsCount = usercodes.length -1;
							let usercodeSet = new Set(Array.from(usercodes).map(usercodes => usercodes.value));
							let usercodeArray = Array.from(usercodeSet)
							let isAuthorConfirm = false;
							$.ajax({
										async : false,
										url: "/servlet/paperAuthor?userCode="+usercodeArray,
										type: "get",
										datatype: "json",
										success: function (response) {
											if((response >= Math.ceil(authorsCount/2))){
												isAuthorConfirm = true;
											}
										}
									}
							)

							if(!isAuthorConfirm){
								alert("저자중 50%이상이 정회원일 경우에만 투고가 가능합니다.")
								return false;
							}

							<%--if(trim(frm.s_0021_aik_sub_hkeyword.value) == ""){--%>
							<%--	alert("<%=au_ins_tre_post_msg6%>");--%>
							<%--	frm.s_0021_aik_sub_hkeyword.focus();--%>
							<%--	return false;--%>
							<%--}--%>

							if(trim(frm.s_0021_aik_sub_ekeyword.value) == ""){
								alert("<%=au_ins_tre_post_msg7%>");
								frm.s_0021_aik_sub_ekeyword.focus();
								return false;
							}

							let keyWordArray = frm.s_0021_aik_sub_ekeyword.value.split(",");
							let regex = /[0-9a-zA-Z]/
							let keyWordSize = 0;
							let keyWords = [];

							keyWordArray.forEach(word => {
								if(regex.test(word)){
									keyWordSize = keyWordSize +1;
									keyWords.push(word)
								}
							})
							// frm.s_0021_aik_sub_ekeyword.value = keyWords.toString().substring(1,(keyWords.toString().length-1))

							if(keyWordSize > 6){
								alert("키워드는 6개까지 입력 가능합니다.")
								return false;
							}else if (keyWordSize < 4){
								alert("키워드는 4개 이상 입력 해야 합니다.")
								return false;
							}

							<%--if(frm.s_0021_aik_sub_hcontent.value.length == 0){--%>
							<%--	alert("<%=au_ins_tre_post_msg8%>");--%>
							<%--	frm.s_0021_aik_sub_hcontent.focus();--%>
							<%--	return false;--%>
							<%--}--%>

							if(frm.s_0021_aik_sub_econtent.value.length == 0){
								alert("<%=au_ins_tre_post_msg9%>");
								frm.s_0021_aik_sub_econtent.focus();
								return false;
							}

							let wordCounting = countWords(frm.s_0021_aik_sub_econtent.value);

							if(!(wordCounting >= 200 || wordCounting <= 250)){
								alert("영문초록은 200-250 단어 범위의 분량이 되도록 한 문단으로 작성해야 합니다.")
								return false;
							}

							let file = document.getElementById("upfile");
							if(file.files[0] == undefined){
								alert("심사본파일을 올려 주십시요");
								return false;
							}else{
								let maxFileSize = 25;
								let fileSize = file.files[0].size/(1024*1024);

								if(fileSize>maxFileSize){
									alert("첨부 파일의 용량은 최대 25Mb 까지 가능합니다.")
									return  false;
								}
							}

							var fn;
							fn = document.getElementById("upfile").value;
							if(fn.length > 0 ) {
								fn = fn.substring(fn.lastIndexOf(".") + 1, fn.length);
								//var fileExtension = ['hwp', 'pdf', 'doc', 'docx'];
								var fileExtension = ['doc', 'docx', 'hwp', 'hwpx'];
								if ($.inArray(fn.toLowerCase(), fileExtension) == -1) {
									alert("<%=ALT_NOT_ALLOWED_FILE_FORMAT%>"+"3");
									return false;
								}
							}

							var fn2;
							fn2 = document.getElementById("upfile2").value;
							fn2 = fn2.substring(fn2.lastIndexOf(".")+1,fn2.length);

							if (fn2 == ""){
								alert("<%=lang.equals("ko")?"표지파일첨부(제출용) 파일을 업로드해 주시기 바랍니다.":"Upload Cover file"%>");
								return false;
							}else{
								var fileExtension = ['doc', 'docx', 'hwp', 'hwpx'];
								if ($.inArray(fn2.toLowerCase(), fileExtension) == -1) {
									alert("<%=ALT_NOT_ALLOWED_FILE_FORMAT%>"+"1");
									return false;
								}
							}

							<%--var fn3;--%>
							<%--fn3 = document.getElementById("upfile3").value;--%>
							<%--fn3 = fn3.substring(fn3.lastIndexOf(".")+1,fn3.length);--%>

							<%--if (fn3 == ""){--%>
							<%--	alert("<%=lang.equals("ko")?"유사도 검사 확인서 파일을 업로드해 주시기 바랍니다.":"Upload similarity check confirmation"%>");--%>
							<%--	return false;--%>
							<%--}else{--%>
							<%--	var fileExtension = ['jpg', 'pdf'];--%>
							<%--	if ($.inArray(fn3.toLowerCase(), fileExtension) == -1) {--%>
							<%--		alert("<%=ALT_NOT_ALLOWED_FILE_FORMAT%>"+"2");--%>
							<%--		return false;--%>
							<%--	}--%>
							<%--}--%>

							document.getElementById("submitbtn").style.display="none";
							frm.action = "/servlet/pro_treatise_post";
							frm.submit();

						}

						function countWords(contents){
							const cleanedStr = contents.trim().replace(/\s+/g, ' ');
							const words = cleanedStr.split(' ');
							return words.length;
						}

						function getExtension(filename) {
							var parts = filename.split('.');
							return parts[parts.length - 1];
						}


						function isScand(filename) {
							var ext = getExtension(filename);
							switch (ext.toLowerCase()) {
								case 'jpg':
								case 'pdf':
									//etc
									return true;
							}
							return false;
						}

						function trim (strSource) { re = /^\s+|\s+$/g; return strSource.replace(re, ''); }

						function attFile(){
							window.open("tre_file_upload.jsp?num=<%=num%>","at1","width=450, height=150");
						}

						function paravalue1(para1, id){

							var obj ;

							if(id=='s_0021_aik_cls_subclass_id2'){
								obj = document.frm.s_0021_aik_cls_subclass_id2;
								frm.s_0021_aik_cls_subclass_id2.disabled=false;
							}else{
								obj = document.frm.s_0021_aik_cls_subclass_id4;
								frm.s_0021_aik_cls_subclass_id4.disabled=false;

							}
							//초기화

							<%

                            String SQL_para="";

                            if(lang.equals("ko"))
                            {
                                SQL_para = "select distinct aik_code_code, aik_code_name from chost_cls_0003 where aik_code_val=";
                            }
                            else
                            {
                                SQL_para = "select distinct aik_code_code, aik_code_ename as aik_code_name from chost_cls_0003 where aik_code_val=";
                            }

                            %>

							switch (para1){

								case '01':
								<%
								int i=1;
								SQL = SQL_para + "'01'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;
								case '02':
								<%
								SQL = SQL_para + "'02'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;
								case '03':
								<%
									SQL = SQL_para + "'03'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;

								case '04':
								<%
									SQL = SQL_para + "'04'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;
								case '05':
								<%
									SQL = SQL_para + "'05'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;
								case '06':
								<%
									SQL = SQL_para + "'06'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;

								case '07':
								<%
									SQL = SQL_para + "'07'";

									Rs = stmt.executeQuery(SQL);
								 i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;
								case '08':
								<%
									SQL = SQL_para + "'08'";

									Rs = stmt.executeQuery(SQL);
								i=1;
								while(Rs.next()){
								%>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
								i++;
								}

								//Rs.next();
								%>
									obj.length = <%=i%>;
									return;
								case '09':
								<%
                                    SQL = SQL_para + "'09'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '10':
								<%
                                    SQL = SQL_para + "'10'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '11':
								<%
                                    SQL = SQL_para + "'11'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '12':
								<%
                                    SQL = SQL_para + "'12'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '13':
								<%
                                    SQL = SQL_para + "'13'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '14':
								<%
                                    SQL = SQL_para + "'14'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '15':
								<%
                                    SQL = SQL_para + "'15'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '16':
								<%
                                    SQL = SQL_para + "'16'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								case '17':
								<%
                                    SQL = SQL_para + "'17'";
                                    Rs = stmt.executeQuery(SQL);
                                    i=1;
                                    while(Rs.next()){
                                    %>
									obj.options[<%=i%>] = new Option("<%=Rs.getString("aik_code_name")%>","<%=Rs.getString("aik_code_code")%>");
								<%
                                i++;
                                }
                            %>
									obj.length = <%=i%>;
									return;
								default:
									obj.options[0] = new Option("<%=au_ins_tre_post_text10%>","");
									obj.length = 1;
									return;
							}

						}

						$(document).ready(function() {
							var max_fields      = 10; //maximum input boxes allowed
							var wrapper         = $(".input_fields_wrap"); //Fields wrapper
							var add_button      = $(".add_field_button"); //Add button ID

							var x = 1; //initlal text box count
							$(add_button).click(function(e){ //on add input button click
								var appendCoAuthorHtml = "";
								e.preventDefault();
								let coauthorGubun = checkCoauthorGubun();
								console.log(coauthorGubun)
								if(x < max_fields){ //max input box allowed
									x++; //text box increment

									appendCoAuthorHtml += '<div class="form-list">';
									appendCoAuthorHtml += '<input class="form-control element-inline input-sm" type="text" name="_0000_aik_coauthor_name" placeholder="<%=HD_NAME %>"/>';
									appendCoAuthorHtml += '<input class="form-control element-inline input-sm" type="text" name="_0000_aik_coauthor_aff" placeholder="<%=au_ins_tre_post_text6 %>" />';
									appendCoAuthorHtml += '<input class="form-control element-inline input-sm" type="text" name="_0000_aik_coauthor_tel" placeholder="<%=j_email %>" />';
									appendCoAuthorHtml += '<select class="form-control element-inline input-sm coauthor_gubun" name="_0000_aik_coauthor_gubun" >';
									//lamda로 뿌려주기
									coauthorGubun.forEach(element =>{
										appendCoAuthorHtml += '<option value="'+element[0]+'">'+element[1]+'</option>';
									})
									appendCoAuthorHtml += '</select>';
									appendCoAuthorHtml += '<input type="button" class="btn btn-primary find-member" value="<%=au_pubcret_text7%>">';
									appendCoAuthorHtml += '<input type="hidden" name="_0000_aik_coauthor_usercode" value="0"/><a href="#" class="remove_field"> ';
									appendCoAuthorHtml += '<i class="ion-ios-close-empty"></i></a></div>';
									$(wrapper).append(appendCoAuthorHtml); //add input box
								}
							});

							$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
								e.preventDefault(); $(this).parent('div').remove(); x--;
							})
						});

						function checkCoauthorGubun(){
							// 리스트에 배열로 구분 코드 / 한글 명 적어서 리턴
							let coauthorGubun = document.getElementsByClassName("coauthor_gubun");
							let outputGubuns = "";
							let existMainAuthor = false;
							let existCorrAuthor = false;
							let gubunArray = new Array();

							for (let i = 0; i <coauthorGubun.length; i++) {
								if(coauthorGubun[i].value == 2){
									existMainAuthor = true;
									existCorrAuthor = true;
								}
								if(coauthorGubun[i].value == 1){
									existMainAuthor = true;
								}
								if(coauthorGubun[i].value == 3){
									existCorrAuthor = true;
								}
							}

							if(existMainAuthor && existCorrAuthor){
								gubunArray.push([4,'공동저자'])
							}else if (existMainAuthor){
								gubunArray.push([3,'교신저자'])
								gubunArray.push([4,'공동저자'])
							}else if (existCorrAuthor){
								gubunArray.push([1,'주저자'])
								gubunArray.push([4,'공동저자'])
							}
							return gubunArray;
						}

						function excellentToggle(value) {
//							alert(value);
							if(value=='04'){
//								alert('t');
								document.getElementById("excellent").style.visibility = "visible";
							}else{
								document.getElementById("excellent").style.visibility = "hidden";
							}
						}

						$(document).on('click', '.find-member' , function() {
							//alert( "Index: " + $( ".find-member" ).index(this) );
							window.open("search_co_author.jsp?index="+$(".find-member").index(this),"pub","width=720, height=450, scrollbars=yes");
						});

						function clearHangulInput(event) {
							const inputField = event.target;
							const inputValue = inputField.value;

							const hangulRegex = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;

							const newValue = inputValue.replace(hangulRegex, '');

							inputField.value = newValue;
						}
					</Script>
					<%
						}catch(SQLException se){

							out.println(se);

						}finally{
							try{
								stmt.close();
								DBCon.close();
							}catch(SQLException se){
								out.println("DBClose Error");
							}
							stmt = null;
							DBCon = null;
						}
					%>
				</div><!-- /.box-body -->
			</div>
			<!-- 논문투고정보 :e -->

		</div>
		<!-- Content :e -->
	</div>
	<!--// content-wrapper :e -->

</div>
<!-- wrapper :e -->

</body>
</html>
<%
	}
%>
<% response.flushBuffer(); %>

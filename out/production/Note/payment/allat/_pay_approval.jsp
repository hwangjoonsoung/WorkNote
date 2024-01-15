<%@ page import="kr.cric.helper.ConfLibrary" %>
<%@ page import="java.time.LocalDate" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%  long won_num = 0;
    while (tk1.hasMoreTokens()) {

        tmptk = tk1.nextToken();
        tk = new StringTokenizer(tmptk, ";");
        mode = tk.nextToken();
        if(!mode.equals("previousMembershipFee")){
            inum = Long.parseLong(tk.nextToken());
            usersel = tk.nextToken();
        }else{
            won_num = Long.parseLong(tk.nextToken());
        }

        if (mode.equals("edit")) {            // 기존회비 각각 납부
            sql = "update kiiee_t_0018 ";
            sql += " set aik_wow_work=now() ";
            sql += ", aik_wow_meth='" + meth + "' ";
            sql += ", aik_wow_confim='1' ";
            sql += ", aik_auth_no='" + sApprovalNo + "' ";
            sql += ", order_no='" + sOrderNo + "' ";
            sql += " where aik_init=" + inum;
            stmt.execute(sql);

        } else if (mode.equals("syear")) {            // 정회원 년회비

            sql = "update kiiee_t_0018 ";
            sql += " set aik_wow_work=now() ";
            sql += ", aik_wow_meth='" + meth + "' ";
            sql += ", aik_wow_confim='1' ";
            if(chkNextYearFee){
                sql += ", aik_wowyear_etc='"+ next_year +"' ";
                sql += ", aik_beg_year='"+ next_year +"' ";
                sql += ", aik_end_year='"+ next_year +"' ";
            }
            if(!chkNextYearFee && isDiscount){
                sql += ", aik_won_num=aik_won_num/2 ";
            }
            sql += ", aik_auth_no='" + sApprovalNo + "' ";
            sql += ", order_no='" + sOrderNo + "' ";
            sql += " where aik_init=" + inum;
            stmt.execute(sql);

        }else if(mode.equals("previousMembershipFee")){
            LocalDate date = LocalDate.now();
            sql= "insert into kiiee_t_0018 ";
            sql += " (order_no, aik_user_code, aik_val_code, aik_won_num, aik_wow_work, aik_wowyear_etc, aik_wowmonth_etc, aik_wow_confim, aik_createdate) " ;
            sql +=" values ( '";
            sql +=sOrderNo+"' , ";
            sql += UserNum +" , ";
            sql += "'02' , ";
            sql += won_num +" , ";
            sql += "now() , ";
            sql += date.getYear() + " , ";
            sql += date.getMonthValue()+ " , ";
            sql += "1 , ";
            sql += "now())";

            stmt.execute(sql);

            sql=" update kiiee_t_0012 set aik_payment_started_at = now() , aik_payment_ended_at =  date_add(now(),interval 1 year) where aik_user_code ="+UserNum;
            stmt.execute(sql);

        }

    }

    //연체, 자격상실 회원이 연회비를 납부했다면 정식회원으로 변경, 평생회원회비를 납부했다면
    int cnt = 0;
    sql = "select count(*) from kiiee_t_0018 c where aik_val_code in ('02','04','10') and c.aik_wow_confim='1' and c.aik_wowyear_etc>='"+curr_year+"' and c.aik_user_code="+UserNum;
    Rs = stmt.executeQuery(sql);
    if (Rs.next()) {
        cnt = Rs.getInt(1);
    }
    Rs.close();
    if(cnt>0){
        sql="update kiiee_t_0012 set aik_state2='1' where aik_state2 in ('4','9') and aik_user_code="+UserNum;
        stmt.execute(sql);
    }

    //승인대상 회원인지 체크
    int cnt2 = 0;
    String new_usernum = "";
    sql = "select count(*) from kiiee_t_0012 c where c.aik_delete = '1' and c.aik_state2 = '3' and ifnull(c.user_num,'')='' and c.aik_user_code="+UserNum;
    Rs = stmt.executeQuery(sql);
    if (Rs.next()) {
        cnt2 = Rs.getInt(1);
    }
    Rs.close();
    if(cnt>0 && cnt2>0){
        new_usernum = ConfLibrary.getNewUserNum();
        sql="update kiiee_t_0012 set aik_state='1' , aik_state2='1', user_num='" + new_usernum + "' , aik_savdate=now() where aik_state2 in ('3') and aik_user_code="+UserNum;
        stmt.execute(sql);
    }
    DBCon.commit();
%>
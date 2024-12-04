/*
package payment.toss;

import kr.cric.helper.ConfLibrary;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Base64;
import java.util.Map;

@WebServlet("/servlet/MembershipPayAcceptController")
public class MembershipPayAcceptController extends HttpServlet {

    private static final String CONTENT_TYPE = "application/json;charset=UTF-8";
    @Resource(name = "jdbc/mysql")
    private DataSource dataSource;
    private static final String Accept_API_URL = "https://api.tosspayments.com/v1/payments/confirm";
    private static final String Cancel_API_URL = "https://api.tosspayments.com/v1/payments/{paymentKey}/cancel";
//    private static final String SecretKey = "test_sk_5mBZ1gQ4YVXJExGXlWj8l2KPoqNb:";//테스트환경 시크릿키
        private static final String SecretKey = "live_sk_LBa5PzR0Arnx7ZB0eqx3vmYnNeDM:";//라이브환경 시크릿키
    private static final String CONTENT_TYPE_HEADER = "application/json";
    String AUTHORIZATION_HEADER ="";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String orderId = req.getParameter("orderId");
        String paymentKey = req.getParameter("paymentKey");
        int amount = Integer.parseInt(req.getParameter("amount"));
        boolean compareResult = Boolean.parseBoolean(req.getParameter("compareResult")); //검증결과
        String aik_init = req.getParameter("aik_init");
        String _is_join = req.getParameter("_is_join");
        String userAuth = req.getParameter("userAuth");

        ResultSet Rs = null;
        String SQL = "";
        String ucode = "";
        String usercode = "";
        String str_ended_at = "";

        //결제 승인요청
        JSONObject jsonBody;
        URL url;
        HttpURLConnection conn;
        BufferedOutputStream bos;
        int status;
        BufferedReader br;
        StringBuilder responseBody;
        String line;
        ObjectMapper mapper;
        Map responseParamter;

        if (compareResult) {
            // 요청 데이터를 JSON 형태로 생성
            jsonBody = new JSONObject();
            jsonBody.put("paymentKey", paymentKey);
            jsonBody.put("orderId", orderId);
            jsonBody.put("amount", amount);

            // URL 객체 생성
            url = new URL(Accept_API_URL);

            // HttpURLConnection 객체 생성
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");

            // 요청에 필요한 헤더 설정
            //시크릿키를 base64로 인코딩
            AUTHORIZATION_HEADER ="Basic "+ new String(Base64.getEncoder().encode(SecretKey.getBytes(StandardCharsets.UTF_8)));

            conn.setRequestProperty("Authorization", AUTHORIZATION_HEADER);
            conn.setRequestProperty("Content-Type", CONTENT_TYPE_HEADER);

            // 요청 데이터 전송
            conn.setDoOutput(true);

            bos = new BufferedOutputStream(conn.getOutputStream());

            bos.write(jsonBody.toJSONString().getBytes(StandardCharsets.UTF_8));
            bos.flush();
            bos.close();

            // 응답 처리
            status = conn.getResponseCode();
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            responseBody = new StringBuilder();
            while ((line = br.readLine()) != null) {
                responseBody.append(line);
            }
            br.close();
            mapper = new ObjectMapper();
            responseParamter = mapper.readValue(responseBody.toString(), Map.class);

            if (200 <= status && status <= 299 && compareResult && responseParamter.get("status").equals("DONE")) {
                try (
                        Connection DBCon = dataSource.getConnection();
                        Statement stmt = DBCon.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        Statement stmt2 = DBCon.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY)) {

                    String aik_initItem = responseParamter.get("orderId").toString().replace("_", ",").substring(0, responseParamter.get("orderId").toString().length() - 13);

                    if (!userAuth.equals("02")) {

                        SQL = "select b.aik_val_code , a.aik_user_code , a.aik_code_ucode , b.aik_wowyear_etc from kiiee_t_0012 a , kiiee_t_0018 b";
                        SQL += " where a.aik_user_code = b.aik_user_code";
                        SQL += " and b.aik_init in (" + aik_initItem + ")";

                        Rs = stmt.executeQuery(SQL);

                        if (Rs.next()) {
                            SQL = "update kiiee_t_0018 ";
                            SQL += " set aik_wow_meth='01' ";  //결제 방법 카드(01) , 카드(학회)(02) , 무통장입금(03) , 실시간계좌이체(04) , 현금 (05), 면제 (07), 기타 (99)
                            SQL += ", aik_wow_confim='1'";
                            SQL += ", aik_wow_work=now()";
                            SQL += ", aik_remark='" + ConfLibrary.getMembershipFeeUsingCode(Rs.getString("aik_val_code")) + "'";
                            SQL += " where aik_init in (" + aik_initItem + ")";

                            stmt2.executeUpdate(SQL);

                            ucode = Rs.getString("aik_code_ucode");
                            usercode = Rs.getString("aik_user_code");
                            str_ended_at = Rs.getString("aik_wowyear_etc") + "-12-31";
                        }
                        Rs.close();

                        // 유효기간 변경 ucode (면제,종신,정회원)에 따른 DB update
                        if (ucode.equals("02")) {
                            SQL = "update kiiee_t_0012 set aik_payment_started_at = CURDATE() , aik_payment_ended_at = DATE_ADD(CURDATE() , INTERVAL 80 YEAR)  where aik_user_code = " + usercode;
                            stmt.executeUpdate(SQL);
                        } else if (ucode.equals("03") || ucode.equals("04")) {
                            SQL = "update kiiee_t_0012 set aik_payment_started_at = CURDATE() , aik_payment_ended_at = '" + str_ended_at + "' where aik_user_code = " + usercode;
                            stmt.executeUpdate(SQL);
                        }
                    } else {

                        //0025테이블 update 단체 회원 update
//                        SQL = "update kiiee_t_0012 set aik_payment_started_at = CURDATE() , aik_payment_ended_at = '" + str_ended_at + "' where aik_user_code = " + usercode;
//                        stmt.executeUpdate(SQL);

                        //0026테이블 update 결제내역 update
                        SQL = "update chost_t_0026 ";
                        SQL += " set aik_wow_meth='01' ";  //결제 방법 카드(01) , 카드(학회)(02) , 무통장입금(03) , 실시간계좌이체(04) , 현금 (05), 면제 (07), 기타 (99)
                        SQL += ", aik_wow_confim='1'";
                        SQL += ", aik_wow_work=now()";
                        SQL += " where aik_init in (" + aik_initItem + ")";
                        stmt.executeUpdate(SQL);

                    }
                    req.getRequestDispatcher("/payment/member/MembershipTossPayRequestReturn.jsp?result=success&usercode="+usercode+"&_is_join="+_is_join).forward(req, resp);
                } catch (Exception e) {
                    // 요청 데이터를 JSON 형태로 생성
                    jsonBody = new JSONObject();
                    jsonBody.put("cancelReason", e.getClass().getSimpleName());

                    // URL 객체 생성
                    url = new URL(Cancel_API_URL.replace("{paymentKey}", req.getParameter("paymentKey")));

                    // HttpURLConnection 객체 생성
                    conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("POST");

                    // 요청에 필요한 헤더 설정
                    AUTHORIZATION_HEADER ="Basic "+ new String(Base64.getEncoder().encode(SecretKey.getBytes(StandardCharsets.UTF_8)));

                    conn.setRequestProperty("Authorization", AUTHORIZATION_HEADER);
                    conn.setRequestProperty("Content-Type", CONTENT_TYPE_HEADER);

                    // 요청 데이터 전송
                    conn.setDoOutput(true);

                    bos = new BufferedOutputStream(conn.getOutputStream());

                    bos.write(jsonBody.toJSONString().getBytes(StandardCharsets.UTF_8));
                    bos.flush();
                    bos.close();

                    // 응답 처리
                    status = conn.getResponseCode();
                    br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    responseBody = new StringBuilder();
                    while ((line = br.readLine()) != null) {
                        responseBody.append(line);
                    }
                    br.close();
                    mapper = new ObjectMapper();
                    responseParamter = mapper.readValue(responseBody.toString(), Map.class);

                    System.out.println(e);
                    req.getRequestDispatcher("/payment/member/MembershipTossPayRequestReturn.jsp?result=fail").forward(req, resp);
                }
            } else {
                req.getRequestDispatcher("/payment/member/MembershipTossPayRequestReturn.jsp?result=fail").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("/payment/member/MembershipTossPayRequestReturn.jsp?result=fail").forward(req, resp);
        }


    }

}
*/

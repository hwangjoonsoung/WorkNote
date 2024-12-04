/*
package kr.cric;

import org.apache.http.client.HttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;

import javax.annotation.Resource;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;

import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.Map;

@WebServlet("/servlet/PayAcceptController")
public class PayAcceptController extends HttpServlet {

    private static final String CONTENT_TYPE = "application/json;charset=UTF-8";
    @Resource(name = "jdbc/mysql")
    private DataSource dataSource;
    private static final String Accept_API_URL = "https://api.tosspayments.com/v1/payments/confirm";
    private static final String Cancel_API_URL = "https://api.tosspayments.com/v1/payments/{paymentKey}/cancel";
    private static final String SecretKey = "test_sk_5mBZ1gQ4YVXJExGXlWj8l2KPoqNb:";//테스트환경 시크릿키
    private static final String CONTENT_TYPE_HEADER = "application/json";
    String AUTHORIZATION_HEADER ="";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String orderId = req.getParameter("orderId");
        String paymentKey = req.getParameter("paymentKey");
        int amount = Integer.parseInt(req.getParameter("amount"));
        boolean compareResult = Boolean.parseBoolean(req.getParameter("compareResult")); //검증결과
        String aik_init = req.getParameter("aik_init"); //검증결과


        ResultSet Rs = null;
        String SQL = "";
        //-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//

        //-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//

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

            if (200 <= status && status <= 299 && compareResult && responseParamter.get("status").equals("DONE")) {

                try (
                        Connection DBCon = dataSource.getConnection();
                        Statement stmt = DBCon.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);) {
                    SQL = "update chost_t_1053 ";
                    SQL += " set aik_paymethod='01' ";  //결제 방법 카드(01) , 카드(학회)(02) , 무통장입금(03) , 실시간계좌이체(04) , 현금 (05)
                    SQL += ", aik_paywon=" + responseParamter.get("totalAmount");
                    SQL += ", aik_paymentflag='1' ";
                    SQL += ", aik_paydate=now() ";
                    SQL += ", aik_auth_no='" + responseParamter.get("orderId") + "' ";
                    SQL += " where aik_init=" + aik_init;

                    stmt.executeUpdate(SQL);

                    req.getRequestDispatcher("/sms_new/TossPayReturn.vm?result=success").forward(req, resp);
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
                    req.getRequestDispatcher("/sms_new/TossPayReturn.vm?result=fail").forward(req, resp);
                }
            } else {
                req.getRequestDispatcher("/sms_new/TossPayReturn.vm?result=fail").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("/sms_new/TossPayReturn.vm?result=fail").forward(req, resp);
        }


    }

}



 */
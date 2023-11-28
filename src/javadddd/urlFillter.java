package javadddd;

public class urlFillter {

    /*
    web.xml을 보면 이렇게 선언이 되어 있다.
    이는 폴더 전체에 있는 모든 파일에 대해서 필더링을 적용하는 것이다.
    프로세스는 다음과 같다.

    1. 해당 폴더 하위의 파일에 접근
    2. filter-name이 작동
    3. 해당 filter-name이 선언한 servlet작동


    *web.xml
    <filter>
      <filter-name>AdminSessionCheckFilter</filter-name>
      <filter-class>kr.cric.AdminSessionCheckFilter</filter-class>
    </filter>
    <filter-mapping>
      <filter-name>AdminSessionCheckFilter</filter-name>
      <!--url-pattern>/app/*</url-pattern-->
      <url-pattern>/staff/*</url-pattern><!-- url from where you implement the filtering -->
    </filter-mapping>

    *kr.cric.AdminSessionCheckFilter
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    String UserAuth = req.getSession().getAttribute("UserStaff")==null?"":req.getSession().getAttribute("UserStaff").toString();

    if(UserAuth.equals("Staff")) {
        chain.doFilter(request, response);
    } else {
        res.sendRedirect("/users/login_staff.vm?rtn="+((HttpServletRequest)request).getRequestURI()); //or page where you want to redirect
        }
    }

    위와 같은 경우 session이 있으면 다음으로 이동하고 session이 없으면 /users/login_staff.vm으로 이동한다 라고 되어 있다.
    따라서 내가 localhost:8080/staff/로 접근하면 /users/login_staff.vm로 이동한다.

    */
}

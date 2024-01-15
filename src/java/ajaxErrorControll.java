package java;

public class ajaxErrorControll {

    /*
    ajax의 error는 200번 이외의 에러를 판단한다.
    즉 catch에서 200번을 던져주면 ajax가 error로 받아드려서 해당 function을 실행시킨다.

    -- javascript --
    function goEmail() {
        $.ajax({
            url: "/user/find_id_email.jsp?s_0012_aik_user_hname=<%=username%>&s_0012_aik_birth=<%=userprenum%>"
        }).success(function () {
            $("#exampleModal").modal('show');
        }).error(function () {
            $("#failModal").modal('show');
        })
    }

    -- controller --
    catch (SQLException se) {
        out.println(se);
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
     */
}

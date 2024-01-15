package java;

public class CallBack {

    /*
            request.setCharacterEncoding("UTF-8");
            String successOrFail = "";
            try {
                Base.open("java:comp/env/jdbc/mysql");

                Category category = Category.findById(request.getParameter("id"));
                String getCategory = request.getParameter("category");
                String site = request.getParameter("site");

                if (request.getParameter("method").equals("delete")) {
                    category.set("deleted", 1);
                    category.set("updated_at", LocalDateTime.now());
                    category.saveIt();
                  }

                if (request.getParameter("method").equals("modify")) {
                    category.set("category", getCategory);
                    category.set("site", site);
                    category.set("updated_at", LocalDateTime.now());
                    category.saveIt();
                    successOrFail = "success";
                }
                out.println(successOrFail);
            } catch (Exception e) {
                successOrFail = "fail";
                out.println(successOrFail);
                e.printStackTrace();
            } finally {
                Base.close();
                request.getRequestDispatcher("category.vm").forward(request, response);
            }

            ajax로 해당 try문을 호출하면 callback은 category.vm을 리턴한다.
            그 따라서 callback을 설정하기 위해서는
            request.getRequestDispatcher("category.vm").forward(request, response);
            해당 부분이 삭제 되어야 한다.

            추가적으로 event.xxxxdefault();를 하면 page이동을 막을 수 있다.
     */


}

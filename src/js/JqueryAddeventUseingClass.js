$(document).ready(function (){
    $(".Author_email").on("change",function () {
        $("#deny_area").show();
        $("#accept_area").hide();
        $("#removetest").remove();
        $("#message_append_area").append(text);
    }
})

/*
1. 위와 같이 document.ready안에 있어야 한다.
이유는 모든 dom 요소가 준비 된 상태에서 event가 부여되야 하기 때문이다.


    */

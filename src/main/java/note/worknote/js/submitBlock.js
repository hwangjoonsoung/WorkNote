/*
submit button을 click이벤트로 confirm을 사용했을때 취소를 눌러도 submit속성때문에 action으로 이동한다.
이걸을 막기 위해 return false를 사용하면 이동하는 것을 막을 수 있다.

$("#editSubmit").on("click", function () {
    let item = confirm("진짜 변경하시겠습니까? \n 변경하면 되돌릴수 없습니다");
    if (item) {
        $("#_method").val("edit_form");
        $("#changed_id").val(changed_id);
    }else {
        return false;
    }
});
 */

/*

 submit block 을 할때 알아야 하는것은 return false가 되어야 한다는 것이다.
 따라서 onsubmit="function name()"을 하는 경우 submit이 작동하기 때문에 onsubmit="return functionName()"으로 작성해야 한다.

 */
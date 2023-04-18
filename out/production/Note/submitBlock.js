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
function pay_methodChange() {
    /*
    id를 가져와서 checked 확인한다
    return 은 boolean으로 나온다 */
    var item1 = document.getElementById('fee_id9').checked;
    var item2 = document.getElementById('fee_id10').checked;
    var item3 = document.getElementById('fee_id11').checked;

    if (item1 || item2 || item3 ) {
        $("#pay_method").attr("disabled", false);
    }
}
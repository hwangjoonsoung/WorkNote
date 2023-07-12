$("input[name='type']:radio").change(function () {
    var value = this.value;
    if (value === "text") {
        $("#started_at").attr("disabled", false);
        $("#ended_at").attr("disabled", false);
        $("#title").attr("disabled", false);
        $("#sub_title").attr("disabled", false);
        $("#place").attr("disabled", false);
        $("#period").attr("disabled", false);
        $("#image_nm").prop("required", false);
    } else {
        $("#title").attr("disabled", true);
        $("#sub_title").attr("disabled", true);
        $("#place").attr("disabled", true);
        $("#period").attr("disabled", true);
        $("#image_nm").prop("required", true);
    }
});
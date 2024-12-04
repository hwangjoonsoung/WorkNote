//1. return false를 하면 vaildation fail
//2. return true를 하면 vaildation successs
$(function () {
    $('#new-registration').formValidation({
        framework: 'bootstrap',
        fields: {
            workshop_pass: {
                validators: {
                    callback: {
                        message: "Please Workshop Pass",
                        callback: function (value, validator) {
                            let chkWorkshop = 0;
                            chkWorkshop = $(":input:radio[name='workshop0']:checked").val() * 1
                                + $(":input:radio[name='workshop1']:checked").val() * 1
                                + $(":input:radio[name='workshop2']:checked").val() * 1
                                + $(":input:radio[name='workshop3']:checked").val() * 1
                                + $(":input:radio[name='workshop4']:checked").val() * 1

                            if ($(":input:radio[name='workshop0']:checked").val() == 2) {
                                chkWorkshop = chkWorkshop / 2;
                            }
                            let isPassChecked = $("input:checkbox[name='workshop_pass']").prop("checked")
                            if (chkWorkshop == 1 && isPassChecked) {
                                return false;
                            }
                        }
                    }
                }
            }
        }
    })
})

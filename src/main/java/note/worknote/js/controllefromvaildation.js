_Author_affiliation: {
    row : "#tdauthor",
        validators: {
        notEmpty: {
            // message: '저자의 소속기관을 선택해 주십시오.<br>'
            message: ' '
        }
    }
},
_Author_other_affiliation: {
    row : "#tdauthor",
        validators: {
        callback: {
            message: '  ',
                callback: function(value, validator, $field) {
                var _Author_affiliation = $('#new-paper').find('[name="_Author_affiliation"]').val();
                return (_Author_affiliation !== '71') ? true : value.trim() !=""? true:false;
            }
        }
    }
},
_Author_korean_name: {
    row : "#tdauthor",
        validators: {
        notEmpty: {
            // message: '저자의 이름을 한글로 입력해 주세요. <br>'
            message: ' '
        }
    }
}
}
})
.on('change', '[name="_Author_affiliation"]', function(e) {
    $('#new-paper').formValidation('revalidateField', '_Author_other_affiliation');
})
    .on('change', '[name="_Author_other_affiliation"]', function(e) {
        $('#new-paper').formValidation('revalidateField', '_Author_other_affiliation');
    })
    .on('success.field.fv', function(e, data) {
        if (data.field === '_Author_other_affiliation') {
            var _Author_affiliation = $('#new-paper').find('[name="_Author_affiliation"]').val();
            // User choose given channel
            if (_Author_affiliation !== '71') {
                // Remove the success class from the container
                data.element.closest('.form-group').removeClass('has-success');

                // Hide the tick icon
                // data.element.data('fv.icon').hide();
            }
        }
    });
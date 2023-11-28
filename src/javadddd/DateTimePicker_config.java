package javadddd;

public class DateTimePicker_config {

    /*
    sideBySide : true  달력+시간 설정 가능
                 false 달력 설정 가능

$(document).ready(function() {
    $('#set-date').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            new_started: {
                validators: {
                    notEmpty: {
                        message: '필수 항목입니다.'
                    }
                }
            },
            new_ended: {
                validators: {
                    notEmpty: {
                        message: '필수 항목입니다.'
                    }
                }
            },
            file_started: {
                validators: {
                    notEmpty: {
                        message: '필수 항목입니다.'
                    }
                }
            },
            file_ended: {
                validators: {
                    notEmpty: {
                        message: '필수 항목입니다.'
                    }
                }
            }
        }
    })
        .on('change', $('#datetimepicker1'), function(e) {
            fv = $('#set-date').data('formValidation');
            fv.enableFieldValidators('new_started', true).revalidateField('new_started');
        })
        .on('change', $('#datetimepicker2'), function(e) {
            fv = $('#set-date').data('formValidation');
            fv.enableFieldValidators('new_ended', true).revalidateField('new_ended');
        })
        .on('change', $('#datetimepicker3'), function(e) {
            fv = $('#set-date').data('formValidation');
            fv.enableFieldValidators('file_started', true).revalidateField('file_started');
        })
        .on('change', $('#datetimepicker4'), function(e) {
            fv = $('#set-date').data('formValidation');
            fv.enableFieldValidators('file_ended', true).revalidateField('file_ended');
        });

    // 기본 옵션
    function DatetimepickerDefaults(opts) {
        return $.extend({},{
            locale: 'ko',
            format: 'YYYY-MM-DD HH:mm',
            inline: true,
            sideBySide: true
        }, opts);
    }

    // 개별 달력 옵션 설정
    $('#datetimepicker1').datetimepicker(DatetimepickerDefaults({
        sideBySide: true
    }));

    $('#datetimepicker2').datetimepicker(DatetimepickerDefaults({
        sideBySide: true
    }));

    $('#datetimepicker3').datetimepicker(DatetimepickerDefaults({
        sideBySide: true
    }));

    $('#datetimepicker4').datetimepicker(DatetimepickerDefaults({
        sideBySide: true
    }));




});





    */
}

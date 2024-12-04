/*
    formValidation을 적용에 필요한 함수 list
    1. format : 'YYYY/MM/DD'
    2. regexp : /^[a-zA-Z0-9_\.]+$/
    3. different : field : 'password2'
    4. stringLength : min , max , message

$('#edit-program').formValidation({
    framework: 'bootstrap',
    icon: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        category_id: {
            validators: {
                regexp: {
                    regexp: /^[0-9]+$/,
                    message: '발표분야를 선택해 주세요.',
                }
            }
        },
        category: {
            validators: {
                notEmpty: {
                    message: '발표분야를 선택해 주십시오.'
                }
            }
        },
        title: {
            validators: {
                notEmpty: {
                    message: '논문제목을 입력해 주십시오.'
                }
            }
        },
        authors: {
            validators: {
                notEmpty: {
                    message: '저자를 입력해 주십시오.'
                }
            }
        },
        program_id: {
            validators: {
                notEmpty: {
                    message: '발표시간 및 장소를 선택해 주십시오.'
                }
            }
        }
    }
});*/
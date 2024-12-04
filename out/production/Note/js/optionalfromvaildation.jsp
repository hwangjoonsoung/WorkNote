<%--
    설명 모든 항목이 입력되어야 validation이 success하도록 만드는 방법
    1.모든 항목이 입력되어야 하는 input의 id를 지정
    2.validation을 적용할 때에는 부모 input을 하나 만들어 적용한다.
    3. keyup을 자식 input에 걸어서 자식 input이 keyup 되면 모든 값이 있는지 확인.
    4. 모든 값이 있다면 부모 input에 값을 입력해 주고, 아니면 빈값으로 입력될 수 있도록 변경
    5. 이후 revalidateField를 통해서 부모 input 값 확인.

    문제는 revalidateField를 하게 되면 focusing 이 안되는 문제가 발생함.
    따라서 revalidateField를 하고 focusing하는 코드를 넣어주면 좋음.
    조건은 revalidateField를 has-error인 경우로 지정하면 된다.
--%>
<script>
    $(function () {
        $('#edit-undergraduate').formValidation({
            framework: 'bootstrap',
            fields: {
                corr_professor_info: {
                    validators: {
                        notEmpty: {
                            message: '발표분야를 선택해 주십시오.'
                        }
                    }
                }
            }
        })
            .on('keyup', 'input[id="corr_professor_info1"] , input[id="corr_professor_info2"] , input[id="corr_professor_info3"] , input[id="corr_professor_info4"] , input[id="corr_professor_info5"]', function (e) {
                let info1 = $('#edit-undergraduate').find('[id="corr_professor_info1"]').val();
                let info2 = $('#edit-undergraduate').find('[id="corr_professor_info2"]').val();
                let info3 = $('#edit-undergraduate').find('[id="corr_professor_info3"]').val();
                let info4 = $('#edit-undergraduate').find('[id="corr_professor_info4"]').val();
                let info5 = $('#edit-undergraduate').find('[id="corr_professor_info5"]').val();
                let all_info = "";

                if (info1 === '' || info2 === '' || info3 === '' || info4 === '' || info5 === '') {
                    all_info = ''
                } else {
                    all_info = '1'
                }

                $('#edit-undergraduate').find('[name="corr_professor_info"]').val(all_info)

                $('#edit-undergraduate').formValidation('revalidateField', 'corr_professor_info');
            })
    });
</script>

<input type="text" class="form-control" name="_author[].name" placeholder="성명" id="corr_professor_info1" />
<input type="text" class="form-control" name="_author[].institution" placeholder="학교 및 학과" id="corr_professor_info2" />
<input type="text" class="form-control" name="_author[].position" placeholder="직책" id="corr_professor_info3" />
<input type="text" class="form-control" name="_author[].email" placeholder="이메일" id="corr_professor_info4" />
<input type="text" class="form-control" name="_author[].phone" placeholder="연락처" id="corr_professor_info5" />

<%  String sessions = "1";
    String edit = "1";

    if(sessions.equals("1")){%>
<input type="hidden" name="corr_professor_info" value="<%=edit%>">
<%}%>
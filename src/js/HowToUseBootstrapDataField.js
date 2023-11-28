/*
1. 데이터를 전송 시작할 event에 data-[name]]="[data]" 로 초기화
2. JS에서 event.relastedTarget을 이용해서 modal의 trigger를 가져옴
3. 가져온 트리거에서 data([name])을 이용하여 초기화된 데이터를 가져옴

ex)
            $('#newModal').on('show.bs.modal', function (event) {

                var button = $(event.relatedTarget) // Button that triggered the modal
                var idx = button.data('id') // Extract info from data-* attributes
                var position = button.data('position')
                var fields = button.data('field')

                const position_options = document.getElementsByClassName("position_option");
                for (let i = 0; i < position_options.length; i++) {
                    if (position_options[i].value == position) {
                        position_options[i].selected = true;
                    }
                }

            }

 */
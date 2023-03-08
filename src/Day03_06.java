public class Day03_06 {


    /*
    조건문이 많아지면 복잡해 진다.
    1. 조건문을 사용한 순서대로 기대값을 나열하면 쉽게 해결할수 있다.
    2. 예시를 보면 pre_file_revision_end가 true를 return하는 순간 조건문이 종료가 됨으로 실제로 사용하는 곳에서 동일하게 pre_file_revision_end가
    실제로 사용될 순서대로 코딩하는 것이 좋다

    조건 설정)
    pre_file_revision_end -> pre_file_revision_start -> else result
    실제로 사용하는 파트)
    if(pre_file_revision_end) -> if(pre_file_revision_start) -> else result

=====================================================================================================================================================================
ex)
        //_config.jsp
        if( compareUsingPresentationFileRevisionEnd > 0 ){
            pre_file_revision_end = true;
        }else if( compareUsingPresentationFileRevisionStart > 0){
            pre_file_revision_start = true;
        }else{
        }

=====================================================================================================================================================================

       //index.jsp
    if (pre_file_revision_end) {
        <div class="alert alert-danger">
            <ul class="paper-more-info">
                <li><i class="ion-alert-circled"></i> 발표자료 제출 기간이 마감되었습니다.</li>
            </ul>
        </div>
    } else {
           if (presentation.equals("구두발표(ORAL)")) {
                <input type="hidden" name="_filename3" id="_filename3" value="<%=presentation_file_name%>">
                if (!pre_file_revision_start) {
                    <div class="alert alert-info">
                        <ul class="paper-more-info">
                            <li><i class="ion-alert-circled"></i> 발표자료 제출 준비중입니다.</li>
                        </ul>
                    </div>
           } else {
                <input type="file" name="_file" id="input-file3" class="file-loading" data-show-preview="false"
                    data-allowed-file-extensions='["pdf","ppt","pptx"]'>
    }
    */


}

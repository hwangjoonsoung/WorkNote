function removeFile(directoryName , id){
    if(confirm("회원의 사진을 삭제하시겠습니까?")){
        var urlStr = '/files/FileController?directoryName='+directoryName+'&fileId='+id;
        $.ajax({
            url: urlStr,
            type: 'DELETE',
            success: function (data) {
                alert("삭제되었습니다.")
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("실패.")
                // console.error('AJAX Error: ' + textStatus);
                // console.error('AJAX Error: ' + jqXHR);
                // console.error('AJAX Error: ' + errorThrown);
            }
        });
    }
}

1. FileController에서 context Type이 JSON으로 선언되어 있어도 마지막에 클라이언트로 return해주는 코드가 없으면 TEXT로 반환된다
2. 즉 여기서 발생하는 문제는 ajax에서 발생하는데
3. ajax에서 dataType이 서버에서 리턴해주는 형태에 맞아야지 error가 안된다.
4. server에서 json이 선언되어 있고 return을 json형태로 return해주면 dataType은 Json으로 되지만
5. 그렇지 않는 경우 해당하는 dataType을 선언해줘야 한다.
6. return이 아무것도 없는 경우 TEXT를 선언해야 한다.
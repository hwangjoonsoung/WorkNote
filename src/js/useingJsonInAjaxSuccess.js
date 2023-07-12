/*

    $.ajax({
        url: "_fileListController.jsp",
        type: "post",
        data: {"parent_id":<%=parent_id%>},
        datatype: "json",
        success: function (resp) {
            $("#fileList").html("");
            $("#fileList").append(resp.callBack);
            filecount = resp.filesize;
        }
    })

    controller에서 jsonObject(직렬화)로 값이 넘어오면
    success에서는 resp로 받아서 사용할 수 있다.
    이때 자동으로 파싱이 이루어 지며 사용할 때에는 resp.KEY로 사용하면 된다.
    ex)
    {1:"A" , 2:"B" , 3:"C" }
    console.log(resp.1) //A
    console.log(resp.2) //B
    console.log(resp.3) //C
 */
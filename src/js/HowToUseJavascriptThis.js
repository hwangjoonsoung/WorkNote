$(".test4").click(function (){
    let checked_corr = $(this).parent().parent().children().children()[4];
    let checked_speaker = $(this).parent().parent().children().children()[5];
    if(checked_corr.checked &&checked_speaker.checked){
        checked_corr.checked = false
        checked_speaker.checked = false
        alert("tete")
    }
})

/*
1. 일단 this를 어디서 호출하는지가 중요하다.
ex ) onclick = function(){
    $(this)
}
1-1 이렇게 함수를 만들어서 사용하고 면 파라미터를 만들고 이벤트에서 파라미터에 this를 입력하는 방식으로 하면 된다.
ex ) <input type="button" onclick="test22(this)" value="add">
function test22(param){
    $(param)
}

위와같이 작업하는 경우 window가 나온다. 그 이유는 어떤 테그 안에 종속되어 있는 것이 아닌 그냥 함수의 실행으로 인해 실행되어 있기 때문이다.
ex2 ) $(".test4").click(function (){
    $(this)
}
이렇게 되면 당연히 this는 해당 class를 가르킨다. 그 이유는 .test4를 click를 하는 것으로 해당 자리에서 $(this)를 실행하기 때문이다.
이렇게 되면 자연스럽게 node 구조를 갖출수 있고 parent , child 노드에 접근할 수 있다.
즉, 어떤 태그 안에서 this를 호출하냐에 따라 달라진다.

<table = "table table-striped">
<tr>
    <th>No</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Affiliation</th>
    <th>Other affiliation</th>
    <th>Corresponding Author</th>
    <th>Speaker</th>
    <th>버튼</th>
</tr>
<tr>
    <td>1</td>
    <td><input></td>
    <td><input></td>
    <td><select name="sosok_id" id="sosok_id" className="form-control mg-b5">
        <option value=""> -search-</option>
    </select>
        <td><input type="text" className="form-control" name="affiliation" maxLength="100" value="<%=UserOffice%>" placeholder="기타 선택시 직접 입력해 주세요"></td>
        <td><input type="checkbox" name="test1" className="test4" value="1"></td>
        <td><input type="checkbox" name="test2" className="test4" value="99"></td>
        <td><input type="button" onClick="appendRow()" value="add"></td>
</tr>
<tr>
    <td>1</td>
    <td><input></td>
    <td><input></td>
    <td><select name="sosok_id" id="sosok_id" className="form-control mg-b5">
        <option value=""> -search-</option>
    </select>
        <td><input type="text" className="form-control" name="affiliation" maxLength="100" value="<%=UserOffice%>" placeholder="기타 선택시 직접 입력해 주세요"></td>
        <td><input type="checkbox" name="test1" className="test4" value="1"></td>
        <td><input type="checkbox" name="test2" className="test4" value="99"></td>
        <td><input type="button" onClick="appendRow()" value="add"></td>
</tr>
</table>
*/

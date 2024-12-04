// attr과 prop의 차이

<input type="radio" name="workshop_pass" id="workshop_pass" value="1">

console.log($("input:radio[name='workshop_pass']").prop("checked")) false
console.log($("input:radio[name='workshop_pass']").attr("checked")) undefined

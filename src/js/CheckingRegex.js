/*
regex reference : https://regexr.com/
*/
let email = 'test@tt.tt';
let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
if(!emailRegex.test(email)){
    alert("이메일을 정확히 입력해주시기 바랍니다.");
}
/*
regex reference : https://regexr.com/
*/
let email = 'test@tt.tt';
let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 이메일
let hangulRegex = /^[a-zA-Z!@#$%^&*()_+={}\[\]:;"'<>,.?/~`\\|-]*$/; // 영어 + 특수문자
const hangulRegex = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; // 한글

if(!emailRegex.test(email)){
    alert("이메일을 정확히 입력해주시기 바랍니다.");
}
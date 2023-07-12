/*
1. 게시판에서 validation을 적용할때 ckeditor은 바로 적용이 안될때
=>CKEDITOR.instances.[texteara id값이 들어가야함].updateElement();

ex)  CKEDITOR.instances.[texteara id값이 들어가야함].updateElement();
    if (frm.s_0026_karse_content.value == "") {
            alert("내용을 입력해 주십시오.");
            frm.s_0026_karse_content.focus();
            return false;
        }

 */
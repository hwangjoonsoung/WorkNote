const httpRequest = new XMLHttpRequest();
httpRequest.onreadystatechange = function(){
    if(this.readyState == 4 && this.status == 200){
        document.getElementById("app").innerHTML = this.responseText;
    }
}
httpRequest.open("GET", "/getAjax", true);
httpRequest.send();
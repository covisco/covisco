$(function () {
    //$('.carousel').carousel();

    $("#freeLink").shuffleLetters();
    $(".myEmail").attr("href", "mailto:" + "info" + "@" + "covisco.com");
    
});


function showStuff(showMe) {
    $("#main").carousel(showMe);
	$("#main").carousel('pause');
}

function urldecode(str) {
   return decodeURIComponent((str+'').replace(/\+/g, '%20'));
}

function emailMe() {
}
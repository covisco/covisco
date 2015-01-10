var cookieName = 'firstVideo';
$(function() {
    checkCookie();
});

function checkCookie() {
    if (document.cookie.length > 0 && document.cookie.indexOf(cookieName + '=') != -1) {
            // do nothing, cookie already sent
    } else {
            // handle jQuery animation

            // set the cookie to show user has already visited
            document.cookie = cookieName + "=1";
			//$("#firstLoad").slideDown();
    }
}

function dismiss(){
	$("#firstLoad").slideUp();
}

function showVideo(){
	$("#firstVideo").lightbox_me({centered: true});
}
function _onLoad () {

	var baseUrl = {
		local: "http://macbook.local/~nazar/forStarters/web",
		devel: "http://qbixstaging.com/FS",
		production: "http://forstartersapp.com"
	};

	window.location=baseUrl.devel+"/start-2.4.html";
}
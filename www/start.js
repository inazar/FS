function _onLoad () {

	var baseUrl = {
		local: "http://macbook.local/~nazar/forStarters/web",
		devel: "http://qbixstaging.com/FS",
		live: "http://forstartersapp.com"
	};

	window.location=baseUrl.local+"/start.html";
}
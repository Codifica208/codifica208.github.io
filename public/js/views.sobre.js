;(function(){
	$.get('https://api.github.com/orgs/codifica208/members', function (members){
		for (var i = 0; i < members.length; i++) {
			var member = members[i];
			var memberElement = '<li class="col-sm-3 col-md-2">'
							  + '<div class="thumbnail">'
							  + '	<img alt="'+ member.login +'" src="'+ member.avatar_url +'">'
							  + '	<a href="'+ member.url +'" class="btn btn-primary btn-block"><i class="fa fa-github"></i> Ver no GitHub</a>'
							  + '</div>';

			$('.front-team ul').append(memberElement);
		}
	})
})();
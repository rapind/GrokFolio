$(document).ready(function() {

	// validate all forms
	$("form").validationEngine();
	
	$('a.delete').live('click', function(event) {
		if ( confirm("Are you sure you want to delete this record?") ) {
			$.post(this.href, {_method:"delete", authenticity_token:AUTH_TOKEN}, function(data) {
				window.location.reload();
   	  }, "json");
		}
		return false;
	});
	
});
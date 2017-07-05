$(document).ready(function () {

$("#loginform").submit(function(event) {
	  	event.preventDefault();
		$('#topmsg').hide();
		var username=$("#username").val();
		if (username.length==0)
		{
			$('#topmsg').fadeIn('slow');
			$('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Enter Username</div>");
			$('#topmsg').delay(5000).fadeOut('slow');
			return false;
		}
		
		var password=$("#password").val();
		if (password.length==0)
		{
			$('#topmsg').fadeIn('slow');
			$('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Enter Password</div>");
			$('#topmsg').delay(5000).fadeOut('slow');
			return false;
		}
		
		var val = $(this).serialize();
  		$.ajax({
      		url: "logincheck.jsp",
      		type: "post",
      		data: val,
  	  		datatype: 'json',
      		success: function(data){
				if(data["result"]=="fail")
				{		
				$('#topmsg').fadeIn('slow');
			    $('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Wrong Username and Password</div>");
				$('#topmsg').delay(10000).fadeOut('slow');
				return false;
				}
				else
				{
				  /* $('#topmsg').fadeIn('slow');
			       $('#topmsg').html("<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Welcome Back!!</div>");*/
					window.location.href = "restricted/index.jsp";
					return false;
				}
				},
      		error: function(){
				$('#topmsg').fadeIn('slow');
			    $('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> A critical Error Occurred</div>");
				$('#topmsg').delay(10000).fadeOut('slow');
				return false;
      			}
			});
		});

});

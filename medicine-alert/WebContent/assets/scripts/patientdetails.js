$(document).ready(function () {
	
    $("#visit_date" ).datepicker({
		dateFormat: 'dd-mm-yy',
	  });
	$('#addnew').click( function(e){
		$('#medform').show();
	  }); 
$('#canceladd').click( function(e){
		$('#medform').hide();
		return false;
	  }); 	  
	
$("#medform").submit(function(event) {
	  	event.preventDefault();
		$('#midmsg').hide();
		$('#midmsg').html("");
		$('#midmsg').show();
		var visit_date = $('#visit_date').val();
		if(visit_date.length==0)
		{	
			$('#midmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Enter Visit Date</div>");
			$('#midmsg').delay(5000).fadeOut('slow');	
			return false;
		}
		
		var val = $(this).serialize();
		
		$.ajax({
      		url: "savemedicine.jsp",
      		type: "post",
      		data: val,
  	  		datatype: 'json',
      		success: function(data){
				if(data.result=="react")
				{
					$('#reaction').modal();
					$('#rbody').html("<H4>Wanrning</H4><h3>"+$('#medicinename').val()+" is reacted with "+data.reactlist+"<br>Data is not Saved");
				}	
				 else if(data.result=="success") 
				{
			//	   $('#topmsg').fadeIn('slow');
			       $('#midmsg').html("<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Saved Successfully</div>");
				   location.reload();
					return false;
					
				}
				else
				{
			       $('#midmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Not Saved</div>");
					return false;
				}
				},
      		error: function(){
			//	$('#topmsg').fadeIn('slow');
			    $('#midmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> A critical Error Occurred</div>");
				$('#midmsg').delay(10000).fadeOut('slow');
				return false;
      			}
			});
		});
	
	  

});
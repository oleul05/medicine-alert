$(document).ready(function () {
	
    $("#dateofbirth" ).datepicker({
		dateFormat: 'dd-mm-yy',
	  });
	
$("#patientform").submit(function(event) {
	  	event.preventDefault();
		$('#topmsg').hide();
		$('#topmsg').html("");
		$('#topmsg').show();
		var patientname=$("#patientname").val();
		if (patientname.length==0)
		{	
			$('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Enter Patient Name</div>");
			$('#topmsg').delay(5000).fadeOut('slow');
			return false;
		}
		
		var dob = $('#dateofbirth').val();
		if(dob.length==0)
		{	
			$('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Enter Date of Birth</div>");
			$('#topmsg').delay(5000).fadeOut('slow');	
			return false;
		}
		
		var val = $(this).serialize();
		
		$.ajax({
      		url: "savepatient.jsp",
      		type: "post",
      		data: val,
  	  		datatype: 'json',
      		success: function(data){
			//	alert(data);
				 if(data.result=="success") 
				{
			//	   $('#topmsg').fadeIn('slow');
			       $('#topmsg').html("<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Saved Successfully</div>");
					return false;
				}
				else
				{
			       $('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Not Saved</div>");
					return false;
				}
				},
      		error: function(){
			//	$('#topmsg').fadeIn('slow');
			    $('#topmsg').html("<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> A critical Error Occurred</div>");
				$('#topmsg').delay(10000).fadeOut('slow');
				return false;
      			}
			});
		});

	
});

function getAlert() {
    //var name = document.getElementById("medicinename").value;
    var name = $("#medicinename").val();
    if(name == "null") {
    	document.getElementById("doesnotwork").innerHTML = "You can choose your selected item";
		//alert("wrong");
	} else {
		document.getElementById("doesnotwork").innerHTML = name + ", Doesn't work with your selected item.";
		alert(name + " Doesn't work with your selected item.");
	}
    
    
    
}
function addmsg(type, msg){

$('#notification_count').html(msg);

}

function waitForMsg(){

$.ajax({
type: "GET",
url: "notify.php",

async: true,
cache: false,
timeout:50000,

success: function(data){
addmsg("new", data);
setTimeout(
waitForMsg,
5000
);
},
error: function(XMLHttpRequest, textStatus, errorThrown){
addmsg("error", textStatus + " (" + errorThrown + ")");
setTimeout(
waitForMsg,
15000);
}
});
};


function waitForNewMsg(){
	$.ajax({
	type: "POST",
	url: "notify2.php",
	async: true,
	cache: false,
	timeout:50000,
	success: function(data){
		console.log(data);
			var result=JSON.parse(data);
			
		 if (result['found']=="yes") 
				 {
				$('#modalnotestitle').html("New Notification :"+result['custname']);
				var msg="";
					msg+="<p>Added by: <b>"+result['addedby']+"</b><BR>  Added Time: <b>"+result['addtime']+"</b><BR><B>Notes : </B>";
					msg+=result['notes']+"</P><hr>";
				
				$('#modalnotes').modal('show');
				$('#modalnotesdetails').html(msg);
				
				}
				else
				{
				setTimeout(waitForNewMsg,5000);
				}
			}
	});
	};

$(document).ready(function(){

waitForMsg();
waitForNewMsg();


});
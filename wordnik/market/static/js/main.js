$(function() {
	// enable main nav list
	$("#jumpToList").change(function() {
		var link = $("#jumpToList option:selected").val()
		window.location.href = "/" + link;
	});
	
	// enable company profile nav list
	$("#compmet").hide();
	$("#compsrc").hide();
	$("#mainNav").change(function() {
		var div = $("#mainNav option:selected").val()
		$(".compInfoDiv").hide()
		$("#comp"+div).show()
		console.log(div)
	});
});

/*
$(function() {
	$("#segmentList").change(function() {
		var id = $("#segmentList option:selected").val()
		window.location.href = "/segment/" + id;
	});
});

$(window).scroll(function(e){ 
  $el = $('#sidebar'); 
  if ($(this).scrollTop() > 200 && $el.css('position') != 'fixed'){ 
    $('#sidebar').css({'left':'650px','position': 'fixed', 'top': '0px'}); 
  } 
});

$(document).ready(function() {
	$('.hidden').show();
	$('.hidden').mouseover(function() {
	  
	(this).show();
  	}).mouseout(function(){
    $(this).hide();
  });
  $('span').click(function() {
  		$(this).show();
  });
	
});
*/
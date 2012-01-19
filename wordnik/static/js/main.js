$(window).scroll(function(e){ 
  $el = $('#sidebar'); 
  if ($(this).scrollTop() > 200 && $el.css('position') != 'fixed'){ 
    $('#sidebar').css({'position': 'fixed', 'top': '0px'}); 
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

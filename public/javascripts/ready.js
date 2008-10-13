$(document).ready(function(){
  //$(".matchable_slider").each(function(i){
  //});
  $(".matchable_slider").slider({
		'slide': function(e, ui){
		  var atr = "#" + $(this).attr('input_id'); 
			$(atr).val(ui.value);
		}
	});
  
});
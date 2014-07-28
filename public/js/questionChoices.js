$(document).ready(function(){
  // Initialize question choices dialog
  $(function() {
    $(".question_choices").dialog({autoOpen : false, modal : true, show : "blind", hide : "blind"});
  });

  // Create additional form fields based on user input
  $("#add_choice").click(function(e){
    console.log(e);
    var numChoices = $(".new_choice input[type='text']").length;
    $(".new_choice").append("<input type='text' placeholder='new option' name='options[option"+(numChoices+1)+"]''><br>");
  })

  // Submit newly created question options
  $(".new_choice").submit(function(e){
    e.preventDefault();
    $( ".question_choices" ).dialog( "close" );
    $.ajax({
      type: "POST",
      data: $(".new_choice").serialize(),
      url: $(".new_choice").attr("action"),
      dataType: "JSON",
    }).success(function(data) {
      console.log(data.options);
      $(".new_choice").each(function(){
            this.reset();
            return false;
          });
      var x;
      for (option in data.options) {
        $("#survey_in_progress ol li[id='"+data.question_id+"'] ul").append("<li>"+data.options[option]+"</li><br>");
      };
    });
  });
});

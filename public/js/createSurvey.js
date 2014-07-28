$(document).ready(function() {

  // Create survey
  $(".question_choices").hide();
  $("#new_survey").submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      data: $("#new_survey").serialize(),
      url: "/surveys/create",
      dataType: "JSON",
    }).success(function(data) {
      $("#new_survey").hide();
      $("h2").html(data.name);
      $(".new_question").attr("action", "/surveys/"+data.id+"/questions/create");
      $(".new_question").attr("id", ""+data.id);
      $(".new_question").append("<input type='text' name='prompt' placeholder='Enter Your Question Here!' required>")
      $(".new_question").append("<input type='submit' value='add your question'>");
    });
  });


  $("#add_choice").click(function(e){
    console.log(e);
    var numChoices = $(".new_choice input[type='text']").length;
    $(".new_choice").append("<input type='text' placeholder='new option' name='options[option"+(numChoices+1)+"]''><br>");
  })
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
  })
});

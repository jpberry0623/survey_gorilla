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



});

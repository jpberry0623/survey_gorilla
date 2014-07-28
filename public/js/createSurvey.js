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
      // console.log(data);
      $("#new_survey").hide();
      $("h2").html(data.name);
      $(".new_question").attr("action", "/surveys/"+data.id+"/questions/create");
      $(".new_question").attr("id", ""+data.id);
      $(".new_question").append("<input type='text' name='prompt' placeholder='Enter Your Question Here!' required>")
      $(".new_question").append("<input type='submit' value='add your question'>");
    });
  });

  // Initialize question choices dialog
  $(function() {
    $(".question_choices").dialog({autoOpen : false, modal : true, show : "blind", hide : "blind"});
  });

  // Create question
  $(".new_question").submit(function(e){
      e.preventDefault();
      var surveyId = this.id;
      $.ajax({
        type: "POST",
        data: $(".new_question").serialize(),
        url: '/surveys/'+surveyId+'/questions/create',
        dataType: "JSON",
      }).success(function(data) {
        $("#survey_in_progress ol").append("<li id='"+data.id+"'>"+data.prompt+"<ul></ul></li>");
        $(".new_choice").attr("action","/surveys/"+surveyId+"/questions/"+data.id+"/choices/create");
        $(".new_choice").append("<input type='hidden' name='survey_id' value="+surveyId);
        $(".new_choice").append("<input type='hidden' name='question_id' value="+data.id);
        $(".new_question").each(function(){
            this.reset();
            $(".question_choices").dialog("open");
            return false;
          });
      }).fail(function(){
        console.log("something is wrong with the question submission");
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
      var x;
      for (option in data.options) {
        $("#survey_in_progress ol li[id='"+data.question_id+"'] ul").append("<li>"+data.options[option]+"</li><br>");
      };
    });
  })
});

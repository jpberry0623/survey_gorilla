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
        // console.log(data);
        $(".new_choice").attr("action","/surveys/"+surveyId+"/questions/"+data.id+"/choices/create");
        $(".new_question").each(function(){
            this.reset();
            $(".question_choices").dialog("open");
            return false;
          });
      }).fail(function(){
        console.log("something is wrong with the question submission");
      });
    });
  $(".new_choice").submit(function(e){
    e.preventDefault();
    console.log(e);
    console.log(this);
    $.ajax({
      type: "POST",
      data: $(".new_choice").serialize(),
      url: "/surveys/"+surveyId+"/questions/"+data.id+"/choices/create",
      dataType: "JSON",
    }).success(function(data) {
      console.log(data);
      // $("#new_survey").hide();
      // $("h2").html(data.name);
      // $(".new_question").attr("action", "/surveys/"+data.id+"/questions/create");
      // $(".new_question").attr("id", ""+data.id);
      // $(".new_question").append("<input type='text' name='prompt' placeholder='Enter Your Question Here!' required>")
      // $(".new_question").append("<input type='submit' value='add your question'>");
    });
  })
});

$(document).ready(function() {
  $(".question_choices").hide();
  $("#new_survey").submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      data: $("#new_survey").serialize(),
      url: "/surveys/create",
      dataType: "JSON",
    }).success(function(data) {
      console.log(data);
      $("#new_survey").hide();
      $("h2").html(data.name);
      $(".new_question").attr("action", "/surveys/"+data.id+"/questions/create");
      $(".new_question").attr("id", ""+data.id);
      $(".new_question").append("<input type='text' name='prompt' placeholder='Enter Your Question Here!' required>")
      $(".new_question").append("<input type='submit' value='add your question'>");
    });
  });

  $(function() {
    $(".question_choices").dialog({autoOpen : false, modal : true, show : "blind", hide : "blind"});
  });

///////////
  $(".new_question").submit(function(e){
      e.preventDefault();
      var surveyId = this.id;
      $.ajax({
        type: "POST",
        data: $(".new_question").serialize(),
        url: '/surveys/'+surveyId+'/questions/create',
        dataType: "JSON",
      }).success(function(data) {
        console.log(data);
        $(".new_question").each(function(){
            this.reset();
            $(".question_choices").dialog("open");
            return false;
          });
      }).fail(function(){
        console.log("something is wrong with the question submission");
      });
    });
});

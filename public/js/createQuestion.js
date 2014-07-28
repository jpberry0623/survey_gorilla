$(document).ready(function(){
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
})

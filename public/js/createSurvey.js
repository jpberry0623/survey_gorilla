$(document).ready(function() {
  $("#new_survey").submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      data: $("#new_survey").serialize(),
      url: "/surveys/create",
      dataType: "JSON",
    }).success(function(data) {
      console.log(data.id);
      $(".new_question").attr("action", "/surveys/"+data.id+"/questions/create");
      $(".new_question").attr("id", ""+data.id);
      $(".new_question").append("<input type='text' name='prompt' placeholder='Enter Your Question Here!'>")
      $(".new_question").append("<input type='submit' value='add your question'>")
    });
  });

  $(".new_question").submit(function(e){
      e.preventDefault();
      console.log(this);
      var surveyId = this.id;
      console.log(surveyId);
      $.ajax({
        type: "POST",
        data: $(".new_question").serialize(),
        url: '/surveys/'+surveyId+'/questions/create',
        dataType: "JSON",
      }).success(function(data) {
        console.log(data);
      //   // $("#survey_questions").append("<tr><td>"+(rowCount+1)+"</td><td>"+data["prompt"]+"</td><td><a href=''>edit question</a></td></tr>");
        $("#new_question").each(function(){
            this.reset();
        });

      }).fail(function(){

      });


      });
});

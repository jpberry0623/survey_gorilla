$(document).ready(function() {
   var surveyId = window.location.pathname.split('/')[2];
  $("#new_question").submit(function(e){
      e.preventDefault();
      console.log(e);
      console.log(surveyId);
      $.ajax({
        type: "POST",
        data: $("#new_question").serialize(),
        url: '/surveys/'+surveyId+'/questions/create',
        dataType: "JSON",
      }).success(function(data) {
        var rowCount = $("#survey_questions tr").length;
        console.log(data);
        $("#survey_questions").append("<tr><td>"+(rowCount+1)+"</td><td>"+data["prompt"]+"</td><td><a href=''>edit question</a></td></tr>");
        $("#new_question").each(function(){
            this.reset();
        });

      }).fail(function(){

      });


      });
    // );
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

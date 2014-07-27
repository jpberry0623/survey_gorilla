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
        console.log(data);
        $("#survey_questions").append("<tr><td>"+data["id"]+"</td><td>"+data["prompt"]+"</td><td><a href=''>edit question</a></td></tr>");

      }).fail(function(){

      });


      });
    // );
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
// Get the element, add a click listener...
document.getElementById("take_survey").addEventListener("click",function(e) {
  x = e.parentNode
  console.log(e.target.name)
  console.log(e.Type == "radio")
  if(e.target.type == "radio") {
    // e.parent.setAttribute('style', 'color: red');
    e.target.style.color = "color";
  }
});

});

$(document).ready(function() {
  var surveyId = window.location.pathname.split('/')[2];
  
  var signUpButt = document.getElementsByClassName("sign-up")[0];
  hi(signUpButt);

  signUpButt.addEventListener("click", showMe, false);

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

});

var hi = function(wazzup){
  console.log(wazzup);
}

var alertMe = function(){
  alert("i iz listening");
}

var showMe = function() {
  dd = document.getElementsByClassName("signupdd")[0];
  dd.className = dd.className + " " + "dropdown-show";
}


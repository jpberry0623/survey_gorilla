$(document).ready(function() {
  var surveyId = window.location.pathname.split('/')[2];
  
  var signUpButt = document.getElementsByClassName("sign-up")[0];
  
  var signUpSubmit = document.getElementsByClassName("sign-up")[0];

  var closeWindowButt = document.getElementsByClassName("close-me")[0];

  signUpButt.addEventListener("click", showMe, false);
  closeWindowButt.addEventListener("click", hideMe, false);


  signUpSubmit.addEventListener("click", function(event){
    $.ajax({
      type: 'POST',
      url: "/color"
    })



  }, false);


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

var hideMe = function() {
  dd = document.getElementsByClassName("dropdown-show");
  for (var el in dd) {
    dd[el].classList.remove("dropdown-show");
  }
  hi(dd);
}


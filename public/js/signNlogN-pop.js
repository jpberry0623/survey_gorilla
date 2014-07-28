$(document).ready(function() {

  $.ajaxSetup ({
      cache: false
  });
  var surveyId = window.location.pathname.split('/')[2];
  
  var signUpButt = document.getElementsByClassName("sign-up")[0];

  
  
  var signUpSubmit = document.getElementsByClassName("send-form")[0];
  hi(signUpSubmit);

  var closeWindowButt = document.getElementsByClassName("close-me")[0];

  signUpButt.addEventListener("click", showMe, false);
  closeWindowButt.addEventListener("click", hideMe, false);

  
  $("#signup").submit(function(e){
    e.preventDefault();
    
    $.ajax({
      type: "POST",
      data: $("#signup").serialize(), 
      url: "/users/create",
      dataType: "JSON",
    }).success(function(data) {
      var logDiv = $(".login-logic")[0];
      console.log(logDiv);
      hideMe();
      $( ".login-logic" )[0].load("_login_logic.erb");
      // $('.login-logic').html("/");
      // $(".new_question").attr("action", "/surveys/"+data.id+"/questions/create");
      // $(".new_question").attr("id", ""+data.id);
      // $(".new_question").append("<input type='text' name='prompt' placeholder='Enter Your Question Here!'>")
      // $(".new_question").append("<input type='submit' value='add your question'>")
    }).fail(function(data){
      hi(data);
    });
  });


});

var hi = function(wazzup){
  console.log(wazzup);
}

var alertMe = function(){
  alert("i iz listening");
};

var showMe = function() {
  dd = document.getElementsByClassName("signupdd")[0];
  dd.className = dd.className + " " + "dropdown-show";
};

var hideMe = function() {
  dd = document.getElementsByClassName("dropdown-show");
  for (var el in dd) {
    dd[el].classList.remove("dropdown-show");
  }
  // hi(dd);
};


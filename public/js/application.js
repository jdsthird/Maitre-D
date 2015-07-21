
var userTypes = {
  newUser: "<input id='hidden-new' class='user-login-type' type='hidden' name='user[type]' value='new'>",
  loginUser: "<input id='hidden-login' class='user-login-type' type='hidden' name='user[type]' value='login'>"
  };

  function loginToggle(){
    $(".user-button").toggle();
    $("#user-form").toggle();
    clearForm();
  };

  function clearForm(){
    // select the form with jquery, then grab the DOMElement
    // then use its reset method
    $("#user-form")[0].reset()
  };

  function userManager() {
    this.users = []
  };

  userManager.prototype.prepareUserSession = function(){
    // this does not seem to be working the way I expect
    //
    $("#race-character-promp").toggle();
    return $("body").on('keydown', function(press){
      if(!press.metaKey){
        press.preventDefault;
      };
      $("#race-character-promp").toggle();
      return press.keyCode
    });
  };

  userManager.prototype.fetchUser =function (formData) {
    return $.ajax({
      url: url,
      data: formData,
      dataType: 'json',
      method: 'post'
    });
  };

  // userManager needs...
  // take login data from the form
  // validate / create user in db
  // create & store a js-user obj

  userManager.prototype.kathulu = function() {
    this.request = this.fetchUser
  };



  userManager.prototype.loginUser = function(){

  };

$(document).ready(function() {

  $("#login-button").on("click", function(e){
    e.preventDefault();
    loginToggle();
    $("#user-form").append(userTypes.loginUser)
  });

  $("#new-user-button").on("click", function(e){
    e.preventDefault();
    loginToggle();
    $("#user-form").append(userTypes.newUser)
  });

  $("#user-form").on("submit", function(e){
    e.preventDefault();
    loginToggle();
    $(".user-login-type").remove();

    console.log($("#user-form").serialize())
  });

// user%5Busername%5D=u&user%5Bpassword%5D=p


 }); // closes ready

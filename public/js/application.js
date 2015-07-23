
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

userManager.prototype.attachToUserButtons = function(){
  this.attachToLoginUserButton();
  this.attachToNewUserButton();
  this.attachToSubmitUserButton();
};

userManager.prototype.attachToLoginUserButton = function(){
  $("#login-button").on("click", function(e){
    e.preventDefault();
    loginToggle();
    $("#user-form").append(userTypes.loginUser)
  });
};

userManager.prototype.attachToNewUserButton = function(){
  $("#new-user-button").on("click", function(e){
    e.preventDefault();
    loginToggle();
    $("#user-form").append(userTypes.newUser)
  });
};

userManager.prototype.attachToSubmitUserButton = function(){
  $("#user-form").on("submit", function(e){
    e.preventDefault();
    loginToggle();
    $(".user-login-type").remove();

    var speedRacer = new Racer();
    speedRacer.initialize($("#user-form").serialize());
    //will the "this" below go to kathulu or #user-form..?
    this.users.push(speedRacer);
  });
};

function Racer() {};

Racer.prototype.initialiaze = function(userParams){
  this.username = userParams.username; // not sure if this works
};



                    // under construction
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
    // to do this, I need to set up an event listener for the form ...in an initialize method?
    // 
  // validate / create user in db
  // create & store a js-user obj

  userManager.prototype.kathulu = function() {
    this.request = this.fetchUser
  };



  userManager.prototype.loginUser = function(){

  };

$(document).ready(function() {

  var kathulu = new userManager();
  kathulu.attachToUserButtons();
  





 }); // closes ready

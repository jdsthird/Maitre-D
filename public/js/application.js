
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

userManager.prototype.deployUserButtons = function(){
  this.bindLoginUserButton();
  this.bindNewUserButton();
  this.bindSubmitUserButton();
};

userManager.prototype.bindLoginUserButton = function(){
$("#login-button").on("click", function(e){
    e.preventDefault();
    loginToggle();
    $("#user-form").append(userTypes.loginUser)
  });
};

userManager.prototype.bindNewUserButton = function(){
  $("#new-user-button").on("click", function(e){
    e.preventDefault();
    loginToggle();
    $("#user-form").append(userTypes.newUser)
  });
};

userManager.prototype.bindSubmitUserButton = function(){
  $("#user-form").on("submit", function(e){
    e.preventDefault();
    loginToggle();
    $(".user-login-type").remove();

    // this is the form right now, parent is user-container...
    // can't remember why I cared about this right now
    // I think I wanted this for/because of capturing the
    var params = $(this).serialize();

    $.ajax({
      url: "not/defined",
      data: params,
      dataType: ''
    })
  });
};

                    // under construction
                    userManager.prototype.prepareUserSession = function(){
                      // this does not seem to be working the way I expect
                      // this seems to work in console
                      // function getKey(){ $(document).on('keypress', function(e){ console.log(e.keyCode)})}
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


$(document).ready(function() {
  var kathulu = new userManager();
  kathulu.deployUserButtons();




 }); // closes ready

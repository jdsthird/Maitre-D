$(document).ready(function() {
  $("#login").on("click", function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(this).find("a").attr("href")
    });

    request.done(function(response) {
      $(".button-container").remove();
      $(".form").html(response);
    });
  });

  $(".form").on("click", "#link-to-signup", function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(this).attr("href")
    });

    request.done(function(response) {
      $("form").remove();
      $(".form").html(response);
    });
  });

  // $(".form").find("#login-form").on("submit", "form", function(event) {
  //   event.preventDefault();
  //   console.log("listening");
  // });

  $(".form").on("submit", "form", function(event) {
    event.preventDefault();
    console.log($(this).attr("action"));

    var request = $.ajax({
      url: $(this).attr("action"),
      method: "POST",
      data: $(this).serialize(),
      dataType: "json"
    });

    request.success(function(response) {
      if(!response.errors) location.href = "/events"
    });

    request.fail(function(response) {
      $(".form").html(response.responseText);
    });
  });

  $("#signup").on("click", function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(this).find("a").attr("href")
    });

    request.done(function(response) {
      $(".button-container").remove();
      $(".form").html(response);
    });
  });

  $(".form").on("click", "#link-to-login", function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(this).attr("href")
    });

    request.done(function(response) {
      $("form").remove();
      $(".form").html(response);
    });
  });
});
$(document).ready(function() {
  $("#new-survey-creator").on("click", "#survey-submission", function(event){
    event.preventDefault();
    $.ajax({
      type: $( "#new-survey-form" ).attr("method"),
      url: $( "#new-survey-form" ).attr("action"),
      data: $( "#new-survey-form" ).serialize()
    }).done(function(response) {
      // $("#survey-submission").remove();
      $("#new-survey-form").html("<h1>" + $("#survey-title").val() + "</h1>")
      $('#new-survey-creator').append(response);
      $("#new-survey-creator").append("<div id = \"finish-creation\"><form id=\"survey-creation-completion\" method=\"get\" action=\"/surveys/" + $("#survey_id").val() + "/show\"><input id = \"done-button\"type=\"submit\" value=\"Done!\"></form></div>");
    });
  });

  $("#new-survey-creator").on("click", "#add-choice", function(event){
    event.preventDefault();
    var count = ($(".choice").length + 1).toString();
    if (count <= 5) {$("#choice-list").append("<li class=\"choice\"><label for=\"choice[text" + count + "]\">Choice" + count + "</label><input type=\"text\" name=\"choice[text" + count + "]\"></li>");};
  });

  $("#new-survey-creator").on("click", "#question-submission", function(event){
    event.preventDefault();
    var url = "/surveys/" + $("#survey_id").val() + "/questions"
    $.ajax({
      type: "POST",
      url: url,
      data:$("#new-question-form").serialize()
    }).done(function(response) {
      var newform = $(response).find("#new-question-creator");
      $("#new-question-creator").replaceWith(newform);
    });
  });

  $("#new-survey-creator").on("click", "#done-button", function(){
    event.preventDefault();
    var url = "/surveys/" + $("#survey_id").val() + "/questions"
    $.ajax({
      type: "POST",
      url: url,
      data:$("#new-question-form").serialize()
    }).done(function(){
      $("#survey-creation-completion").submit();
    });
  });
});

// SURVEY MODEL

function Survey(options) {
  this.title = options.title;
  this.questions = options.questions || [];
}

Survey.prototype.load = function(surveyJSON) {

}

Survey.prototype.submit = function() {
  $.post("/surveys",{
    data: this.buildSubmissionData()
  })
}

Survey.prototype.buildSubmissionData = function() {
  return JSON.parse(this.questions.map(function(question) {
      return question.buildWithChoices()
    }));
}


// QUESTION MODEL

function Question(options) {
  this.text = options.text;
  this.choices = options.choices || [];
}

Question.prototype.buildWithChoices = function() {
  //
}



// CHOICE MODEL

function Choice(options) {
  this.text = options.text
}

// CONTROLLER

function Controller() {
  this.survey = new Survey();
  this.setListeners();
  this.getSurveyName();
}

Controller.prototype.getSurveyName = function() {
  this.survey.name = prompt("Please enter the name for your survey?")
}

Controller.prototype.setListeners = function() {
  $("#save-button").click(function() {
    this.survey.submit();
  })
}





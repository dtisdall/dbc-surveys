var question = 2;
var next_question = question + 1;
var question = document.getElementsByClassName("question")[0];
$( document ).ready(function() {
    console.log( "ready!" );
    $('.question_button').on("click", function(event){
      event.preventDefault();
        console.log("Great, you prevented it!! ^_^");
        // document.getElementById().style.display = "none";
        // document.getElementsByClassName('question').style.display = "on";
        // question ++ ;
        // next_question ++;
        // $document.showNextQuestion()
         // document.getElementById(2).style.display = "on";
         // document.getElementById(3).style.display = "none";

        // $.ajax({
        //         type: "POST",
        //         url:"survey/respondent/"+ question.id ,
        //         data: $(this).serialize()
        //       }).done(function(data){
        //      console.log(data);
        //     $('#data').html(data);
        //     })
          })
});

function showNextQuestion(current) {

  alert(current);
  var element = document.getElementByID(current);
  alert(element);
  // alert("#"+current)
  // var next_question = current +1;
  // document.getElementById(current).style.display = "none";
  // document.getElementById(next_question).style.display = "on";;
}


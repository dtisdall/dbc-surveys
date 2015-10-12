$(document).ready(function() {

  var wrapper         = $("#choices"); //Fields wrapper
  var add_button      = $(".add_field_button"); //Add button ID

  $(add_button).click(function(e){ //on add input button click
      e.preventDefault();
      var amt = $(".choice").length + 1;
      // debugger;
      $(wrapper).append('<li class="choice more"><label for="choice[{amt}]">Choice</label><input type="text" name="choice[{amt}]"><a href="#" class="remove_field">Remove</a></li>'.supplant({ amt: amt}));
      });


  $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
      e.preventDefault();
      $(".more").last().remove();
  })



});


String.prototype.supplant = function (o) {
    return this.replace(/{([^{}]*)}/g,
        function (a, b) {
            var r = o[b];
            return typeof r === 'string' || typeof r === 'number' ? r : a;
        }
    );
};

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery3
//= require popper
//= require bootstrap
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})

function winner(comparator) {
  var msg = '';
  switch(comparator) {
    case 1: 
      msg = 'you win!';
      break;
    case -1:
      msg = 'you lost!';
      break;
    default:
      msg = 'draw';
  }
  return msg;
}

$(document).ready(function() {
  $('#rock,#paper,#scissors').on("click", function(event){
      var type = $(this).attr('id');
      $.ajax({
          url: "/games/throw/" + $(this).attr('id'),
          beforeSend: function() {
            $('#user-pick').text(type);
            $('.spinner-border').removeClass('d-none');
          },
          success: function(msg) {
            $('#comp-pick').text(msg['comp_pick']['type']);
            $('#result').text(winner(msg['winner']))
          },
          complete: function() {
            $('.spinner-border').addClass('d-none');
          }
      })
  });
})

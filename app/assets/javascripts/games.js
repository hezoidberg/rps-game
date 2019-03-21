//= require jquery3
//= require popper
//= require bootstrap
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
});

function winner(comparator) {
  var msg = '';
  switch(comparator) {
    case 1: 
      msg = 'YOU WIN!'; 
      break;
    case -1:
      msg = 'YOU LOST!';
      break;
    default:
      msg = 'DRAW!';
  }
  return msg;
}

function image_path(type) {
  return '/assets/' + type.charAt(0).toUpperCase() + type.slice(1);
}

$(document).ready(function() {
  $('#rock,#paper,#scissors').on("click", function(event){
      var type = $(this).attr('id');
      $.ajax({
          url: "/games/throw/" + $(this).attr('id'),
          beforeSend: function() {
            $('#comp-result').addClass('d-none');
            $('#user-pick').text(type);
            $('.spinner').removeClass('d-none');
            $('#result-user-img').attr('src', image_path(type));
          },
          success: function(msg) {
            $('#result').text(winner(msg['winner']));
            $('#result-comp-img').attr('src', image_path(msg['comp_pick']['type']));
            $('#comp-result').removeClass('d-none');
          },
          complete: function() {
            $('.spinner').addClass('d-none');
          }
      })
  });
})

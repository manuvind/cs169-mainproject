var reloadForm = function() {
    var selected = $('#shift_volunteers').val();
    
    var id = name = email = phone = '';

    if (selected != 'New Volunteer...') {
      volunteer_selection = $('.volunteer_selection[name=' + selected + ']');
      var id = volunteer_selection.attr('id');
      var name = selected;
      var email = volunteer_selection.attr('email');
      var phone = volunteer_selection.attr('phone');
    }

    $('#volunteer_id').val(id);
    $('#volunteer_name').val(name);
    $('#volunteer_email').val(email);
    $('#volunteer_phone').val(phone);
  };

$(document).ready(function() {
  reloadForm();
  $('#shift_volunteers').change(reloadForm);
});

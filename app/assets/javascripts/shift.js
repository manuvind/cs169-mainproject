var reloadForm = function() {
    var selected = $('#shift_volunteers').val();
    
    var id = name = email = phone = '';

    if (selected != 'New Volunteer...') {
      volunteer_selection = $('.shift_volunteer_selection[name=' + selected + ']');
      id = volunteer_selection.attr('id');
      name = selected;
      email = volunteer_selection.attr('email');
      phone = volunteer_selection.attr('phone');
      $('#save_vol_info').attr('hidden', true);
    } else
      $('#save_vol_info').attr('hidden', false);

    $('#shift_volunteer_id').val(id);
    $('#shift_volunteer_name').val(name);
    $('#shift_volunteer_email').val(email);
    $('#shift_volunteer_phone').val(phone);
  };

$(document).ready(function() {
  reloadForm();
  $('#shift_volunteers').change(reloadForm);
});

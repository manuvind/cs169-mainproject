var reloadForm = function() {
    var selected = $('#shift_volunteers').val();
    
    var id = name = email = phone = '';

    if (selected != 'New Volunteer...') {
      volunteer_selection = $('.shift_volunteer_selection[name=' + selected + ']');
      id = volunteer_selection.attr('id');
      name = selected;
      email = volunteer_selection.attr('email');
      phone = volunteer_selection.attr('phone');

      // Prevent altering saved volunteer info
      $('#shift_volunteer_id').attr('readOnly', true);
      $('#shift_volunteer_name').attr('readOnly', true);
      $('#shift_volunteer_email').attr('readOnly', true);
      $('#shift_volunteer_phone').attr('readOnly', true);

      $('#save_vol_info').attr('hidden', true);
    } else {
      $('#shift_volunteer_id').attr('readOnly', false);
      $('#shift_volunteer_name').attr('readOnly', false);
      $('#shift_volunteer_email').attr('readOnly', false);
      $('#shift_volunteer_phone').attr('readOnly', false);

      $('#save_vol_info').attr('hidden', false);
    }

    $('#shift_volunteer_id').val(id);
    $('#shift_volunteer_name').val(name);
    $('#shift_volunteer_email').val(email);
    $('#shift_volunteer_phone').val(phone);
  };

$(document).ready(function() {
  reloadForm();
  $('#shift_volunteers').change(reloadForm);
});

var days_of_months = {'1': 31,
					  '2': parseInt($('#event_time_1i').val()) % 4 == 0 ? 29 : 28,
					  '3': 31,
					  '4': 30,
					  '5': 31,
					  '6': 30,
					  '7': 31,
					  '8': 31,
					  '9': 30,
					  '10': 31,
					  '11': 30,
					  '12': 31
					 };

var updateDates = function () {
	var selected_month = $('#event_time_2i').val();
	var last_day_of_month = days_of_months[selected_month];

	$('#event_time_3i option').remove();
	var day = 1;
	while (day <= last_day_of_month) {
		$('#event_time_3i').append('<option value="' + day + '">' + day + '</option>');
		day += 1;
	}
}

$(document).ready(function() {
  updateDates();
  $('#event_time_2i').change(updateDates);
});
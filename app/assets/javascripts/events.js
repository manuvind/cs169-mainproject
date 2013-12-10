var regexes, form_control_ids, form_group_ids, volunteerInfoValidation;

regexes = {'name': 	/.+/,
	       'email':	/(.+)@([0-9]|[a-z]|[A-Z])+\.([a-z]|\.)+$/,
	       'phone': /((.*)[0-9]){7}(.*)/
	      };

form_control_ids = {'name': 	'#shift_volunteer_name',
				    'email':	'#shift_volunteer_email',
				    'phone': 	'#shift_volunteer_phone'
				   };

form_group_ids = {'name': 	'#shift_volunteer_name_form_group',
				  'email':	'#shift_volunteer_email_form_group',
				  'phone': 	'#shift_volunteer_phone_form_group'
				 };

/*	Generates keyup event handlers for specific fields in the create shift form.
	Currently supported fields '#shift_volunteer_name', '#shift_volunteer_email', '#shift_volunteer_phone'

	regex: 			RegExpr to match the input string with
	field_type: 	String to extract the CSS id for the input's form-control
					and form-group from form_control_ids and form_group_ids
*/
volunteerInfoValidation = function (field_type) {
	var specificEventHandler = function () {
		var form_control_id, form_group_id, regex, input;

		form_control_id = form_control_ids[field_type];
		form_group_id = form_group_ids[field_type];
		regex  = regexes[field_type];

		input = $(form_control_id).val();

		if (input.match(regex))
			$(form_group_id).removeClass('has-error').addClass('has-success');
		else
			$(form_group_id).removeClass('has-success').addClass('has-error');
	}
	return specificEventHandler;
}

$(document).ready(function() {
  $('#shift_volunteer_name').keyup(volunteerInfoValidation('name'));
  $('#shift_volunteer_email').keyup(volunteerInfoValidation('email'));
  $('#shift_volunteer_phone').keyup(volunteerInfoValidation('phone'));
});
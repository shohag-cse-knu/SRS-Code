<script type="text/javascript">
		$( document ).ready(function(){
			$.validator.addMethod("validatepswd", function (value, element) {
				if (value != '') {
					//var patt = /^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/;
					var patt = /^.*(?=.{6,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/;
					if (patt.test(value)) {
						$.validator.messages.validatepswd = "";
						return true;
					} else {
						$.validator.messages.validatepswd = "Your password must contain atleast 1 number, 1 upper and lower-case letter";
						return false;
					}
				}
			});
			$("#resetpsswrdForm").validate({
				rules: {
					newpassword: {
						required: true,
						minlength:6,
						validatepswd: true,
						maxlength: 50
					},
					confirmnewpassword: {
						required: true,
						equalTo: "#newpassword",
					},
				},
				messages: {
					newpassword: {
						required: "Required",
						minlength: "Your password must be at least 6 characters long"
					},
					confirmnewpassword: {
						required: "Required",
						equalTo: "Please enter the same password as above"
					},
				}
			});
		});
	</script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>


	<label>Enter a name</label>
	<input type="text" id="phone_dir" name="phone_dir"
		onInput="showNames()">

	<select id="cityId">

	</select>

</body>
<script type="text/javascript">
	function showNames() {
		var name = $('#phone_dir').val();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "/loadNames",
			data : name,
			dataType : 'json',
			cache : false,
			timeout : 600000,
			success : function(data) {
				var html = '';
				var len = data.length;
				html += '<option value="0"></option>';
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i] + '">' + data[i]
							+ '</option>';
				}
				html += '</option>';
				$('#cityId').html(html);
			},
			error : function(e) {
				$('#cityId').html("");
			}
		});
	}
</script>
</html>
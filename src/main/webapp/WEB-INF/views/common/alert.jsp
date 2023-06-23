<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script type="text/javascript">
		const message = "${msg}";
		const url = "${url}";
		alert(message);
		document.location.href = url;
	</script>
</body>
</html>
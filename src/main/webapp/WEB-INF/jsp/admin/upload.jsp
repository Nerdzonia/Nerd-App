<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminPage</title>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/admin/">Back</a></li>
	</ul>
	<h2>PNG - JPG - MP4</h2>
	<form method="post" action="uploadfile" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="Movie Title">
		<input type="text" name="synopsis"  placeholder="Synopsis">
		<input type="file" name="fileUploadPhoto" accept="image/*"  placeholder="Photo">
		<input type="file" name="fileUploadVideo" accept="video/*"  placeholder="Video">
		<input type="submit" value="Enviar">
	</form>
</body>
</html>
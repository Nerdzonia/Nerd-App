<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/admin/movie/">Back</a></li>
	</ul>

	<h1>${media.name}</h1>
        
	<h2>Media Tags</h2>
	<c:forEach items="${mediaTag}" var="mediaTag">
            <br>Remove: <a href="${pageContext.request.contextPath}/admin/movie/removeTag/${mediaTag.code}">${mediaTag.tag.tagName}</a>
    </c:forEach>         
            
	<h3>Tag List</h2>
		
		<c:choose>
			<c:when test="${newTag != null}">
				<c:forEach items="${newTag}" var="varTag">
    				<br>Add: <a href="${pageContext.request.contextPath}/admin/movie/addTag/${varTag.code}/${media.code}">${varTag.tagName}</a>
    			</c:forEach>
			</c:when>
    		<c:otherwise>
    			<c:forEach items="${tag}" var="varTag">
    				<br>Add: <a href="${pageContext.request.contextPath}/admin/movie/addTag/${varTag.code}/${media.code}">${varTag.tagName}</a>
    			</c:forEach>
    		</c:otherwise>
		</c:choose>
             
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/clappr@latest/dist/clappr.min.js"></script>
<body>
	<%@ include file="../include/menu.jsp" %>
	<center>
		<h1>${media.name}</h1>
		<div id="player" class="responsive-video">
		</div>
		<article>${media.synopsis}</article>
		<article>${media.datetime}</article>
		<div>
			<form action="${pageContext.request.contextPath}/video/videoComment" method="post">
				<input type="hidden" name="videoCode" value="${media.code}">
				<input type="text" name="message" maxlength="255" placeholder="sua mensagem aqui" autocomplete="off"/>
				<input type="submit" value="Enviar"/>
			</form>
		</div>
		<c:forEach items="${comment}" var="comment">
			<div class="box">
				<div class="color comment-title">${comment.person.name}</div>
					<div class="color comment-comment row">
						<p>${comment.comment}</p>
					</div>		
					<article>${comment.datetime}</article>
					<c:if test="${comment.person.code == userSession.person.code}">
						<a href="${pageContext.request.contextPath}/video/delete/${comment.code}/${media.code}">Apagar</a>
					</c:if>
			</div>
			
		</c:forEach>
	</center>
	<script type="text/javascript">
		var player = new Clappr.Player({source: "${media.urlVideo}", parentId: "#player"});
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
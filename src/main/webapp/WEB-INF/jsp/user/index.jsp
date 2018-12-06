<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<%@include file="../include/head.jsp" %>
<body>
  <%@ include file="../include/menu.jsp" %>
  
  <!--CAROUSEL-SLIDER-->
  <div class="slider">
      <ul class="slides">
      	<c:forEach items="${banner}" var="banner" end="3">
      		<li>
	          <img src="${banner.urlPhoto}" class="responsive-img">
	          <div class="caption left-align black-text">
	            <h3>${banner.name}</h3>
	            <h5 class="light black-text text-lighten-3">Disponivel na NerdZonia</h5>
	            <a class="waves-effect waves-light btn red" href="${pageContext.request.contextPath}/video/assistir/${banner.code}"><i class="material-icons left">send</i>Assista Agora</a>
	          </div>
        	</li>
      	</c:forEach>
      </ul>
    </div>

    <!--CATALAGOS DE FILMES-->
    <section> 
    	
        <form action="${pageContext.request.contextPath}/searchMediaByName" method="get" style="margin-top:70px;">
        	<input type="text" name="movieName" placeholder="Digite aqui o nome do filme que deseja encontrar" style="color:white; text-align:center;" autocomplete="off">
        </form>
        
        <c:if test="${movie != null}">
			<div class="primary-1">
				<blockquote class="white-text">
				Encontramos os seguintes filmes!
				</blockquote>
        	</div>
        </c:if>
   		
     <!--Resultado da Procura -->  
        <div class="row">
	        <c:forEach items="${movie}" var="movie">
	     		<div class="grid-example col s12 m4">
	            <div class="card">
	                <div class="card-image waves-effect waves-block waves-light">
	                  <img class="activator" src="${movie.urlPhoto}" width="700" height="199">
	                </div>
	                <div class="card-content">
	                  <span class="card-title activator grey-text text-darken-4">${movie.name}<i class="material-icons right">more_vert</i></span>
	                  <p><a href="${pageContext.request.contextPath}/video/assistir/${movie.code}" class="waves-effect waves-light btn small red"><i class="material-icons left">play_arrow</i>Assista Agora</a></p>
	                </div>
	                <div class="card-reveal">
	                  <span class="card-title grey-text text-darken-4">Sinopse<i class="material-icons right">close</i></span>
	                  <p>${movie.synopsis}</p>
	                </div>
	              </div>
	          </div>
	     	</c:forEach>
        </div>	
    
      <div class="primary">
        <blockquote class="white-text">
          Filmes Disponiveis
        </blockquote>
        </div>

     <!--FILMES-->   
        <div class="row">
	        <c:forEach items="${media}" var="media">
	     		<div class="grid-example col s12 m4">
	            <div class="card">
	                <div class="card-image waves-effect waves-block waves-light">
	                  <img class="activator" src="${media.urlPhoto}" width="700" height="199">
	                </div>
	                <div class="card-content">
	                  <span class="card-title activator grey-text text-darken-4">${media.name}<i class="material-icons right">more_vert</i></span>
	                  <p><a href="${pageContext.request.contextPath}/video/assistir/${media.code}" class="waves-effect waves-light btn small red"><i class="material-icons left">play_arrow</i>Assista Agora</a></p>
	                </div>
	                <div class="card-reveal">
	                  <span class="card-title grey-text text-darken-4">Sinopse<i class="material-icons right">close</i></span>
	                  <p>${media.synopsis}</p>
	                </div>
	              </div>
	          </div>
	     	</c:forEach>
        </div>	 
      </section>
	  
      <%@ include file="../include/footer.jsp" %>
	</body>

</html>
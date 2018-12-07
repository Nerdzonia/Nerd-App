<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@include file="../include/head.jsp" %>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/profile.css"/>
<body>
    <%@ include  file="../include/menu.jsp" %>    
    <section>
		<center>
    	<img src="${userSession.person.profile.urlProfile}" class="profile-img">
   		 <h1 class="text-profile">${userSession.person.name}</h1>
   		 <h3>Atualizar Perfil</h3>
          <form action="atualizeProfilePhoto" method="post" enctype="multipart/form-data" style="margin-bottom:50px;">
          	<input type="file" name="fileUpload" accept="image/*" required>
          	<input type="submit" placeholder="Enviar">
          </form>
        <div class="box">
            <div class="boxAccoutSettings">
                <form action="atualizeProfile" method="post" class="row">
                	<div class="input-field col s6">
			           <i class="material-icons prefix">account_circle</i>
			           <input type="text" name="name" placeholder="Digite seu nome" id="first-name" maxlength="150" value="${userSession.person.name}" autocomplete="off" required>
			           <label for="first_name">Nome</label>
			         </div>
			         <div class="input-field col s6">
			           <input type="text" name="nickname" id="nickname" maxlength="20" value="${userSession.person.profile.nickname}" autocomplete="off" placeholder="Digite seu apelido">
			           <label for="nickname">Sobrenome</label>
			         </div>
			         <div class="input-field col s6">
			           <i class="material-icons prefix">event</i>
			           <input type="date" name="birthday" maxlength="30" value="${userSession.person.profile.birthday}" autocomplete="off">
			         </div>
                    <div class="input-field col s6">
                    	<label for="sex">Gênero</label>
			           <input type="text" name="sex" id="sex" maxlength="30" value="${userSession.person.profile.sex}" placeholder="Defina seu Gênero:" autocomplete="off">
			         </div>
                    <div class="spaceBar">
                        <label>Cidade:</label>
                        <div class="inputStyle">
                            <input type="text" name="city" maxlength="30" value="${userSession.person.address.city}" placeholder="Nome da cidade:" autocomplete="off">
                        </div>
                    </div>
                    <div class="spaceBar">
                        <label>Bairro:</label>
                        <div class="inputStyle">
                            <input type="text" name="neighborhood" maxlength="30" value="${userSession.person.address.neighborhood}" placeholder="Nome do bairro:" autocomplete="off">
                        </div>
                    </div>
                    <div class="spaceBar">
                        <label>Rua:</label>
                        <div class="inputStyle">
                            <input type="text" name="street" maxlength="100" value="${userSession.person.address.street}" placeholder="Nome da rua:" autocomplete="off">
                        </div>
                    </div>
                    <div class="spaceBar">
                        <label>Numero:</label>
                        <div class="inputStyle">
                            <input type="number" name="number" maxlength="10" value="${userSession.person.address.number}" placeholder="Numero da casa:" autocomplete="off">
                        </div>
                    </div>
                    <div class="submitButton">
                        <input type="submit">
                    </div>
                </form>
                <br>
                
                 <br>
                <h3>Atualizar Background</h3>
                <h5>Para evitar bugs envie background com dimensões inferior a 500x500</h5>
                <img src="${userSession.person.profile.urlBackground}" width="200px" heigt="auto">
                <form action="atualizeProfileBackground" method="post" enctype="multipart/form-data" style="margin-bottom:50px;">
                	<input type="file" name="fileUpload" accept="image/*" required>
                	<button class="btn waves-effect">Enviar</button>
                </form>
            </div>
        </div>
        </center>
    </section>
    <script>
    $(document).ready(function () {
    	document.addEventListener('DOMContentLoaded', function() {
    	    var elems = document.querySelectorAll('select');
    	    var instances = M.FormSelect.init(elems);
    	  });     
    });
	   
	</script>	
    <%@ include file="../include/footer.jsp" %>
</body>

</html>
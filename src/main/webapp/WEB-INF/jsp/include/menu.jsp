<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="red darken-4">
    <div class="nav-wrapper">
      <a href="/" class="brand-logo">
      <img src="https://res.cloudinary.com/nerdzonia/image/upload/v1543461601/nerdzoniaicon.ico" width="30" height="30" class="d-inline-block align-top" alt="">NerdZonia
      </a>
      <a href="escorpo.html" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="${pageContext.request.contextPath}/"><i class="material-icons left">style</i>Home</a></li>
        <li><a href="${pageContext.request.contextPath}/conta"><i class="material-icons left">person</i>Perfil</a></li>
        <li><a href="#"><i class="material-icons left">notifications</i>Notifações</a></li>
        <li><a href="#"><i class="material-icons left">settings</i>Configurações</a></li>
        <li><a href="${pageContext.request.contextPath}/sair"><i class="material-icons left">close</i>Sair</a></li>
      </ul>
    </div>
  </nav>

  <ul class="sidenav" id="slide-out">
    <li><div class="user-view">
    <div class="background">
      <img src="${userSession.person.profile.urlBackground}">
    </div>
      <a href="${pageContext.request.contextPath}/conta"><img class="circle" src="${userSession.person.profile.urlProfile}"></a>
      <a href="${pageContext.request.contextPath}/conta"><span class="white-text name">${userSession.person.name}</span></a>
      <a href="${pageContext.request.contextPath}/conta"><span class="white-text email">${userSession.person.profile.email}</span></a>
    </li>
    <li><a href="${pageContext.request.contextPath}/"><i class="material-icons left">style</i>Home</a></li>
    <li><a href="${pageContext.request.contextPath}/conta" class="waves-effect"><i class="material-icons">person</i>Perfil</a></li>
    <li><a href="#" class="waves-effect"><i class="material-icons">notifications</i>Notificações</a></li>
    <li><a href="#" class="waves-effect"><i class="material-icons">settings</i>Configurações</a></li>
    <li><div class="divider"></div></li>
    <li><a href="${pageContext.request.contextPath}/sair" class="waves-effect"><i class="material-icons">close</i>Sair</a></li>
  </ul>
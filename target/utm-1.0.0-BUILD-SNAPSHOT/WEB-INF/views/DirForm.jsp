<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/includes/Bootstrap.jsp" %>
<html>
<head>
    <title><fmt:message key="form.title"/></title>
</head>
<body>
    <c:set var="locale" value="${param.locale != null ? param.locale : (sessionScope.locale != null ? sessionScope.locale : pageContext.request.locale)}" scope="session" />
    <fmt:setLocale value="${locale}" scope="session" />
    <fmt:setBundle basename="me.jmll.i18n.app" var="appBundle" />
    <div class="container">
        <h2><fmt:message key="form.header" bundle="${appBundle}"/></h2>
        <form action="DirView.do" method="post">
            <div class="form-group">
                <label for="path"><fmt:message key="form.path.label" bundle="${appBundle}"/></label>
                <input type="text" class="form-control" id="path" name="path" required placeholder="/ruta/directorio" />
            </div>
            <button type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-search"></span> <fmt:message key="form.submit" bundle="${appBundle}"/>
            </button>
        </form>
        <c:if test="${not empty errores}">
            <div class="alert alert-danger">
                <ul>
                    <c:forEach var="error" items="${errores}">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
    <%@ include file="/WEB-INF/includes/BootstrapJS.jsp" %>
</body>
</html>

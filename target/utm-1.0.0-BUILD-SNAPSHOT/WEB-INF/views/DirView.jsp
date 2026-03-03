<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/includes/Bootstrap.jsp" %>
<html>
<head>
    <title><fmt:message key="view.title"/></title>
</head>
<body>
    <c:set var="locale" value="${param.locale != null ? param.locale : (sessionScope.locale != null ? sessionScope.locale : pageContext.request.locale)}" scope="session" />
    <fmt:setLocale value="${locale}" scope="session" />
    <fmt:setBundle basename="me.jmll.i18n.app" var="appBundle" />
    <div class="container">
        <h2><fmt:message key="view.header" bundle="${appBundle}"/></h2>
        <c:if test="${fn:length(paths) lt 1}">
            <div class="alert alert-warning">
                <fmt:message key="view.no.files" bundle="${appBundle}"/>
            </div>
        </c:if>
        <c:if test="${fn:length(paths) ge 1}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th><fmt:message key="view.table.name" bundle="${appBundle}"/></th>
                        <th><fmt:message key="view.table.path" bundle="${appBundle}"/></th>
                        <th><fmt:message key="view.table.size" bundle="${appBundle}"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="file" items="${paths}">
                        <tr>
                            <td>${file.getFileName()}</td>
                            <td>${file.toString()}</td>
                            <td>${file.toFile().length()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
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

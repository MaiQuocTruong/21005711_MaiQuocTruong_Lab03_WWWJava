<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Multi-language Demo</title>
</head>
<body>
    <!-- Set ngôn ngữ dựa vào giá trị của radio button -->
    <c:set var="languageCode" value="${param.radLanguageCode}" />
    
    <c:if test="${not empty languageCode}">
        <fmt:setLocale value="${languageCode}" scope="session" />
    </c:if>
    
    <!-- Gán bundle file tương ứng với ngôn ngữ -->
    <fmt:setBundle basename="resource" scope="session" />
    
    <form action="login.jsp" method="POST">
        <!-- Chọn ngôn ngữ -->
        <fmt:message key="languageMessage" /> <br />
        <input type="radio" name="radLanguageCode" value="vi" 
               <c:if test="${languageCode == 'vi'}">checked</c:if> /> 
        <fmt:message key="vn" />
        
        <input type="radio" name="radLanguageCode" value="en" 
               <c:if test="${languageCode == 'en'}">checked</c:if> /> 
        <fmt:message key="en" />
        
        <input type="submit" name="submit" value="<fmt:message key='chooseButton' />" />
        
        <!-- Form đăng nhập -->
        <table border="0">
            <tr>
                <td><fmt:message key="userName" /></td>
                <td><input type="text" name="txtUserName" value="" /></td>
            </tr>
            <tr>
                <td><fmt:message key="pass" /></td>
                <td><input type="password" name="txtPassword" value="" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="<fmt:message key='login' />" />
                </td>
            </tr>
        </table>
    </form>
    	<br/>
    <a href="registration-form.jsp">Go to Bai1</a>
        <br/>
    <a href="${pageContext.request.contextPath}/register">Go to Bai2</a>
        <br/>
    <a href="${pageContext.request.contextPath}/product">Go to Product Page</a>
</body>
</html>

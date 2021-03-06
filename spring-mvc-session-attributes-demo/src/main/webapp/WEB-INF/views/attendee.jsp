<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attendee page</title>
<style type="text/css">
	.error{
		color:#ff0000;
	}
	.errorblock{
		color: #000;
		background-color: : #ffEEEE;
		border : 3px solid #ffff;
		padding: 8px;
		margin: 16px;
	}
</style>
</head>
<body>
	
	<form:form commandName="attendee">
	 	<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
	 	<label for="textinput1"> Enter Name:</label>
	 	<form:input path="name" cssErrorClass="error"/>
	 	<form:errors path="name" cssClass="error"/>
	 	<br>
	 	
	 	<label for="textinput2"> Enter email address:</label>
	 	<form:input path="email" cssErrorClass="error"/>
	 	<form:errors path="email" cssClass="error"/>
	 	<br>
	 	
	 	<input type="submit" class="btn" value="Enter Attendee"/>
	</form:form>
</body>
</html>
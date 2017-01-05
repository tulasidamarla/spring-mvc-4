Spring MVC provides form tag library which can be used in place of html form tag to utilize features like model binding from controller to view, handling errors for different elements in the form etc. 

Spring form tags and attributes can be accessed in the jsp page with the taglib directive

	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

Here is the sample jsp page with spring form tags.

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
		<form:form modelAttribute="event">
		 	<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
		 	<label for="textinput1"> Enter Minutes:</label>
		 	<form:input path="name" cssErrorClass="error"/>
		 	<form:errors path="name" cssClass="error"/>
		 	<br>
		 	<input type="submit" class="btn" value="Enter Event"/>
		</form:form>
	</body>
	
spring form tag has few additional attributes like modelAttribute(or commandName), cssClass, cssStyle etc. It has lot of additional sub tags like input, errors etc. Most of the form sub tags like input, errors have attribute named path which binds the property defined in modelAttribute.

For binding the model objects to views spring provides a Model object(or ModelMap) to the method as an argument. For ex,

	@RequestMapping(value="/event", method = RequestMethod.GET)
	public String displayEventpage(ModelMap model) {
		Event event = new Event();
		event.setName("Java User Group");
		//model.addAttribute("greeting", "Hello World from Spring 4 MVC");
		model.addAttribute(event);
		return "event";
	}
 	
org.springframework.ui.Model contains the few important methods.

	Model addAttribute(String attributeName, Object attributeValue);
	Model addAttribute(Object attributeValue);
	Model addAllAttributes(Collection<?> attributeValues);
	Model addAllAttributes(Map<String, ?> attributes);
	Model mergeAttributes(Map<String, ?> attributes);
	boolean containsAttribute(String attributeName); 	

Note: Mostly we use addAttribute() method. If attributeName is not provided, then name of the attribute is chosen from standard conventions.i.e. camel case names for object types. 


	  
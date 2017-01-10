Adding validation using spring requires following steps.
1)error tags of spring form tag library.
2)Add maven dependencies of java validation(api) and hibernate validator(api implementor).
3)Add validation annotations to properties of all Model classes.
4)Add BindingResult method argument in controller method to check for errors.

view changes
------------

	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<form:form commandName="attendee">
	 	<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
	 	<label for="textinput1"> <spring:message code="attendee.name"/></label>
	 	<form:input path="name" cssErrorClass="error"/>
	 	<form:errors path="name" cssClass="error"/>
	 	<br>
	 	
	 	<label for="textinput2"> <spring:message code="attendee.email"/></label>
	 	<form:input path="email" cssErrorClass="error"/>
	 	<form:errors path="email" cssClass="error"/>
	 	<br>
	 	
	 	<input type="submit" class="btn" value="Enter Attendee"/>
	</form:form>
	
&lt;form:errors&gt; tag used for displaying error messages.

Maven Dependencies
------------------
	<dependency>
        <groupId>javax.validation</groupId>
        <artifactId>validation-api</artifactId>
        <version>1.1.0.Final</version>
    </dependency>
    <dependency>
        <groupId>org.hibernate</groupId>
        <artifactId>hibernate-validator</artifactId>
        <version>5.0.3.Final</version>
    </dependency>

Note: Hibernate validator is an implementation of java validation api. It is originally developed for validating hibernate entities.

Model changes
-------------
	public class Attendee {
	
		@Size(min=2, max=30)
		private String name;
		@NotEmpty @Email
		private String email;
	
		public String getName() {
			return name;
		}
	
		public void setName(String name) {
			this.name = name;
		}
	
		public String getEmail() {
			return email;
		}
	
		public void setEmail(String email) {
			this.email = email;
		}
	}

Note: Size annotation is provided by java validation api whereas, NotEmpty, Email are from hibernate. For all the validation constraints of java api refer to javax.validation.constraints package. For all validation constraints of hibernate refer to org.hibernate.validator.constraints pakcage.

Controller changes
------------------

	@RequestMapping(value="/attendee", method=RequestMethod.POST)
	public String saveAttendee(@Valid Attendee attendee, BindingResult result){
		if(result.hasErrors()){
			return "attendee";
		}
		return "redirect:index";
	}

Note: The order of parameters should be Model followed by BindingResult. If the order of parameters is changed, a runtime exception will occur.

	
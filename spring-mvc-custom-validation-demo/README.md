Custom Messages
---------------
To add custom validation changes have to be done in properties file. If internationalization is enabled, then all properties files have to be modified. For ex,

	Size.attendee.name = Attendee Name must be between {2} and {1} characters 
	Email = Not a valid email address
	NotEmpty = Field cannot be left blank
	
	attendee.name = Enter Name
	attendee.email = Enter Email

Note: Size is java validation api annotation. In general application contains multiple model objects. Using Size annotation, different model objects can set different messages. Whereas, Using Email and NotEmpty all model objects in the application use the same message. For ex,

	Size.customer.name =  Customer Name must be between {2} and {1} characters 

Validation using Custom Annotations
-----------------------------------
Using custom validation have some advantages like cleaner implementation, more descriptive messages, also can write custom validation logic. For ex, phone validation can be done using regex. To write Custom validation logic, the following steps are required.

1) write custom annotations.

```
	@Documented
	@Constraint(validatedBy=PhoneConstraintValidator.class)
	@Target({ElementType.METHOD,ElementType.FIELD})
	@Retention(RetentionPolicy.RUNTIME)
	public @interface Phone {
		String message() default "{Phone}";
		
		Class<?>[] groups() default {};
		
		Class<? extends Payload>[] payload() default {};
	}
```

2) write constraint validator.

	public class PhoneConstraintValidator implements ConstraintValidator<Phone, String> {
	
		@Override
		public void initialize(Phone phone) {
			
		}
	
		@Override
		public boolean isValid(String phoneField, ConstraintValidatorContext context) {
			if(phoneField.isEmpty()){
				return false;
			}
			return phoneField.matches("[0-9()-]*");
		}
	}

3) Add the annotation in the model class to the phone property.

	@Phone
	private String phone;

4)view changes
		
		<label for="textinput3"> <spring:message code="attendee.phone"/></label>
	 	<form:input path="phone" cssErrorClass="error"/>
	 	<form:errors path="phone" cssClass="error"/>		

5)property file changes
	
	Phone = Not a valid phone number
	attendee.phone = Enter Phone Number

		 	

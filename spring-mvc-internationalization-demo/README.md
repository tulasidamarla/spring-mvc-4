To Add internationalization using spring there are few steps required.

Configuration changes
---------------------
1)Add messageSource() method in WebConfig file<br>
2)Add localeResolver() method to set our current locale to avoid keep requesting everytime<br>
3)override addInterceptor() of WebMvcConfiguereAdapter to look for locale change<br>

properties file
---------------
4)add message.properties(message-{locale}.properties) files

View changes
------------
5)create spring messages tag inside jsp pages to display the values<br>
6)add anchor tags to changing languages

Please see the sample code below.

	@Configuration
	@EnableWebMvc
	@ComponentScan(basePackages = "com.web")
	public class WebApplicationConfiguration extends WebMvcConfigurerAdapter {
		@Bean
		public MessageSource messageSource() {
			ResourceBundleMessageSource source = new ResourceBundleMessageSource();
			source.setBasename("appmessages");
			return source;
		}
	
		@Bean
		public LocaleResolver localeResolver() {
			SessionLocaleResolver resolver = new SessionLocaleResolver();
			resolver.setDefaultLocale(Locale.ENGLISH);
			return resolver;
		}
	
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
			interceptor.setParamName("language");
			registry.addInterceptor(interceptor);
		}	
	}

Note: 
1)The bean methods messagesSource() and localeResolver() are autowired byName. Internationalization won't work if method names are changed.
2)properties file name should be as configured in messageSource() method. i.e. appmessages_en.properties, appmessages_es.properties etc. 

Jsp Page 
	
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<html>
		<body>
			<a href="?language=en">English</a>
			<a href="?language=es">Spanish</a>
			
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
		</body>
	</html>

Note: The Jsp page should have links(anchor tags) to translate the page into different languages. For ex, 
	<a href="?language=en">English</a>
	<a href="?language=es">Spanish</a>

href attribute has query parameter with name as defined in interceptor parameter name defined above.

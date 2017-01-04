For writing spring mvc configuration, Spring MVC 4 provides Java configuration or xml configuration(spring mvc 3 or lower versions for backward compatability). To bootstrap the application(to hook servlet 3.0), again spring provided Java configuration or xml configuration(web.xml).

Infact, servlet 3.0 eliminates the need for web.xml, but we can still use. In this example we use web.xml and Java configuration. Here is the sample web.xml file. Servlet init-params contain location of Java Configuration file and the context class to load annotations.

	<web-app id="WebApp_ID" version="3.0"
	   xmlns="http://java.sun.com/xml/ns/j2ee"   	    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"   		xsi:schemaLocation="http://java.sun.com/xml/ns/javaee   		http://java.sun.com/xml/ns/j2ee/web-app_3_0.xsd">
   		<!-- The front controller of this Spring Web application, responsible for handling all 		application requests -->
		<servlet>
			<servlet-name>springDispatcherServlet</servlet-name>
			<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
			<init-param>
				<param-name>
					contextClass
				</param-name>
				<param-value>
					org.springframework.web.context.support.AnnotationConfigWebApplicationContext
				</param-value>
			</init-param>
			<init-param>
				<param-name>contextConfigLocation</param-name>
				<param-value>com.web.config.WebConfig</param-value>
			</init-param>
			<load-on-startup>1</load-on-startup>
		</servlet>
		<!-- Map all requests to the DispatcherServlet for handling -->
		<servlet-mapping>
			<servlet-name>springDispatcherServlet</servlet-name>
			<url-pattern>*.html</url-pattern>
		</servlet-mapping>
	</web-app>
 
   
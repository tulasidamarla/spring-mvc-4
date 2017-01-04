Spring MVC 4 supports container less application development. A container less application
typically contains Java configuration, JEE 6/Servlet 3.0+ , Embedded Tomcat/Jetty and Configuration.

Application contains everything including configuration of server, hence the name container less.

In Spring MVC 4, Instead of XML configuration Java configuration can be used. 

Any Java class can become a spring mvc configuration file if it is annotated with the following annotations.

@Configuration --> represents a spring configuration file <br/>
@EnableWebMvc  --> To enable spring mvc

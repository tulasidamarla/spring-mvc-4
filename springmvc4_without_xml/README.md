To eliminiate web.xml configuration and write a java configuration file to bootstrap the application, java class has to implement the interface "org.springframework.web.WebApplicationInitializer". This interface contains one call back method with a ServletContext object passed in it. This context object can be used to hook spring configuration classes like DispatcherServlet etc.

Here is the example:

	public class WebAppInitializer implements WebApplicationInitializer{

		public void onStartup(ServletContext servletContext) throws ServletException {
			 
	        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
	        
	        ctx.register(WebApplicationConfiguration.class);
	        ctx.setServletContext(servletContext);
	 
	        ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
	 
	        servlet.setLoadOnStartup(1);
	        servlet.addMapping("/");
	    }
	}   

	

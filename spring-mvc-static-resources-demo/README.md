To configure static resources prior to spring mvc 4, mvc namespace is given. For ex,

	<mvc:resources location="assests" mapping="/assets/**"/>
	<mvc:resources location="pdfs" mapping="/pdfs/**"/>

To configure static resources in spring mvc 4, Configuration file has to either extend WebMvcConfigurereAdapter or implement either WebMvcConfigurer like this.

	public class WebApplicationConfiguration extends WebMvcConfigurerAdapter{
	    @Bean
	    public ViewResolver viewResolver() {
	        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
	        viewResolver.setViewClass(JstlView.class);
	        viewResolver.setPrefix("/WEB-INF/views/");
	        viewResolver.setSuffix(".jsp");
	 
	        return viewResolver;
	    }
	    
	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    	registry.addResourceHandler("/pdfs/**").addResourceLocations("/WEB-INF/pdfs/");
	    }
	}

 	
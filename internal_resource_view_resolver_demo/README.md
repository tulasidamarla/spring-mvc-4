In general views are placed in WEB-INF to secure webpages instead of accessing them 
from public locations. To Implement this spring provides InternalResourceViewResolver. Accessing views directly from public locations won't help because data is only rendered from spring model attributes if views are navigated through controllers by DispatcherServlet. To use InternalResourceViewResolver add the following configuration in the webConfig.java file. 

	@Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
 
        return viewResolver;
    }

Now, from application simply return a string which represents the name of the jsp file. For ex, if  welcome.jsp is in /WEB-INF/views directory, then methods can return view names without extension like this.

	@RequestMapping(method = RequestMethod.GET)
	public String sayHello(ModelMap model) {
		model.addAttribute("greeting", "Hello World from Spring 4 MVC");
		return "welcome";
	}

	

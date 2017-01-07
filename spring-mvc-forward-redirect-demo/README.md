Spring MVC extended the servlet api functionality of forward and redirect. servlet api has provided these functionalities way back in servlet 1.0 specification. 

Redirect transfers the control to browser and new request goes through the browser. Hence, there will be a change of URL(web browser). Whereas forward is a server side action in which same request will be forwarded. Hence user will not see any change of URL.

Spring MVC way of forward and redirect are much simpler than Servlet API. Here is the sample code below.

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String redirect(ModelMap model) {
		return "redirect:event";
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String forward(ModelMap model) {
		return "forward:event";
	}


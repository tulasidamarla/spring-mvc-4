To post data from a spring form to controller, the controller method must have mapping as RequestMethod.POST. Otherwise a 405 error occurs.

To process data in the controller method, method must be given ModelAttribute object as an argument. For ex,

	@RequestMapping(value="/event", method = RequestMethod.POST)
	public String saveEvent(@ModelAttribute("event") Event ev) {
		System.out.println("event " + ev.getName() + " is saved");
		return "event";
	}

Note: ModelAttribute name "event" must be the same name given in the form tag attribute "modelAttribute".

	
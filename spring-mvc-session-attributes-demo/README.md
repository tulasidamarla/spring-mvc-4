Spring MVC has provided session attributes which are similar to session objects of servlet api. To set session attributes , unlike servlet api, no code is required. Controller class needs to be annotated with @SessionAttributes. For ex,

	@Controller
	@SessionAttributes("event")
	public class EventController {
		@RequestMapping(value="/event", method = RequestMethod.GET)
		public String displayEventpage(ModelMap model) {
			Event ev = new Event();
			ev.setName("Java User Group");
			//model.addAttribute("greeting", "Hello World from Spring 4 MVC");
			model.addAttribute(ev);
			return "event";
		}
	
		@RequestMapping(value="/", method = RequestMethod.GET)
		public String redirect(ModelMap model) {
			return "redirect:event";
		}
		
		@RequestMapping(value="/event", method = RequestMethod.POST)
		public String saveEvent(@ModelAttribute("event") Event event) {
			System.out.println("event " + event.getName() + " is saved");
			return "redirect:index";
		}
		
		@RequestMapping(value="/index", method = RequestMethod.GET)
		public String displayIndexpage() {
			return "index";
		}
	}
	
Note: SessionAttributes can take an array of values like @SessionAttributes({"event","attendee"}).


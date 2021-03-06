package controllers;

import javax.inject.Inject;

import annotations.Public;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import components.UserSession;
import repository.MediaRepository;

@Controller
public class HomeController {
	
	@Inject
	private UserSession userSession;
	@Inject
	private Result result;
	MediaRepository mediaRepository = new MediaRepository();
	
	//main
	@Public
	@Get("/")
	public void home() {
		if(userSession.isLogged()) {
			result.redirectTo(UserController.class).index();
		}
	}
    //Set logged false for session object
    @Get("sair")
    public void exit() {
    	userSession.setLogged(false);
    	result.redirectTo(this).home();
    }
        
}

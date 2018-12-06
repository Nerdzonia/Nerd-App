package controllers;

import javax.inject.Inject;

import annotations.Public;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import components.UserSession;
import model.Address;
import model.Person;
import model.Profile;
import repository.PersonRepository;

@Controller
public class RegisterController {
	
	@Inject
	private Result result;
	@Inject
	private UserSession userSession;
	
	PersonRepository personRepository = new PersonRepository();
	
	//page to register
	@Public
	@Get("/register")
	public void register() {
		if (userSession.isLogged()) {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	//form validation
	@Public
	@Post("sendRegister")
	public void sendRegister(String name, String email, String nickname, String password, String confirmPassword) {
		Person p = personRepository.searchSpecificEntityValueIntoPerson("profile", "email", email);
		if (p == null && password.equals(confirmPassword)) {
			Person person = new Person();
			Profile profile = new Profile();
			Address address = new Address();

			profile.profileUuid();
			profile.setEmail(email);
			profile.setNickname(nickname);
			profile.setPassword(password);
			profile.setUrlProfile("https://res.cloudinary.com/nerdzonia/image/upload/v1543297504/sample.jpg");
			profile.setUrlBackground("https://res.cloudinary.com/nerdzonia/image/upload/v1543258389/Home/photo/download.jpg2abed234-9569-4ce0-903a-f8770af68633.jpg");
			
			address.addressUuid();

			person.personUuid();
			person.setName(name);
			person.setAddress(address);
			person.setProfile(profile);
			person.setAdmin("0");
			
			userSession.setLogged(true);
			personRepository.savePerson(person);

			userSession.setPerson(person);
			result.redirectTo(UserController.class).index();
		} else {
			result.redirectTo(RegisterController.class).register();
		}
	}
}

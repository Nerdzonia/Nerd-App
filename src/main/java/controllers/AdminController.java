package controllers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import components.UserSession;
import model.Comment;
import model.Media;
import model.Person;
import repository.CommentRepository;
import repository.MediaRepository;
import repository.PersonRepository;
import util.FilesUpload;


@Controller
@Path("admin")
public class AdminController {
	
	@Inject
	private Result result;
	@Inject
	private UserSession userSession;
	
	FilesUpload upload = new FilesUpload();
	
	MediaRepository mediaRepository = new MediaRepository();
	CommentRepository commentRepository = new CommentRepository();
	PersonRepository personRepository = new PersonRepository();
	
	Media media = new Media();
	
	//Main
	@Get("/")
	public void adminmenu() {
		if(userSession.getPerson().getAdmin().equals("0")) {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	//movie list for edit
	@Get("/listMovies")
	public void listmidia() {
		if(userSession.getPerson().getAdmin().equals("1")) {
			List<Media> media = mediaRepository.listAllVideo();
			result.include("media", media);
		}else {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	//Get name and search media ilike movieName and return object media to listmidia
	@Post("searchMediaByName")
	public void listMediaByName(String movieName) {
		List<Media> media = mediaRepository.searchMediaByName(movieName);
		result.include("movie", media);
		result.redirectTo(this).listmidia();
	}
	
	//edit opition for this video
	@Get("/editar/{code}")
	public void admineditmovie(String code) {
		if(userSession.getPerson().getAdmin().equals("1")) {
			Media media = mediaRepository.searchMediaCode(code);	
				List<Comment> comment = commentRepository.searchCommentByMedia(code);
				result.include("comment", comment);
				result.include("media", media);
		}else {
			result.redirectTo(HomeController.class).home();
		}
		
	}
	
	//save edit
	@Post("editFile")
	public void editFile(String code, String name, String synopsis) {
		if(userSession.getPerson().getAdmin().equals("1")) {
			Media media = mediaRepository.searchMediaCode(code);
			media.setName(name);
			media.setSynopsis(synopsis);
			
			mediaRepository.updateMedia(media);
		}
		result.redirectTo(this).listmidia();
	}
	
	//upload photo and video 
	@Get("/upload")
	public void upload() {

	}
	
	//save photo and video
	@Post("uploadfile")
	@UploadSizeLimit(sizeLimit = 100 * 1024 * 1024, fileSizeLimit = 100 * 1024 * 1024)
	public void uploadfile(String title, String synopsis, UploadedFile fileUploadVideo, UploadedFile fileUploadPhoto) {
		if(fileUploadVideo != null && fileUploadPhoto != null && userSession.getPerson().getAdmin().equals("1")) {
			Map<String, String> uploadResultVideo = upload.upload(fileUploadVideo);
			Map<String, String> uploadResultPhoto = upload.upload(fileUploadPhoto);
			
			if(uploadResultVideo != null && uploadResultPhoto != null) {
				media.mediaUuid();
				media.setDatetime(new Date(System.currentTimeMillis()));
				media.setName(title);
				media.setSynopsis(synopsis);
				media.setPerson(userSession.getPerson());
				
				media.setUrlVideo(uploadResultVideo.get("url"));
				media.setMediaVideoName(uploadResultVideo.get("public_id"));
				media.setMediaVideoType(fileUploadVideo.getContentType());
				
				media.setUrlPhoto(uploadResultPhoto.get("url"));
				media.setMediaPhotoName(uploadResultPhoto.get("public_id"));
				media.setMediaPhotoType(fileUploadPhoto.getContentType());
				
				mediaRepository.saveMedia(media);
			}
		}
			result.redirectTo(HomeController.class).home();
	}
	
	//list all peoples
	@Get("/addAdmin")
	public void addadmin() {
		if(userSession.getPerson().getAdmin().equals("1")) {
			List<Person> person = personRepository.listAllPerson();
			result.include("person", person);
		}else {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	//add admin power or remove for this person
	@Get("/addPowerOrRemove/{code}")
	public void addPower(String code) {
		if(userSession.getPerson().getAdmin().equals("1")) {
			Person person =  personRepository.searchPersonId(code);
			if(person.getAdmin().equals("1")) {
				person.setAdmin("0");
			}else {
				person.setAdmin("1");
			}
			
			personRepository.updatePerson(person);
			result.redirectTo(this).addadmin();
		}else {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	//search people and return an object from db
	@Post("searchPersonEmailAdmin")
	public void searchPersonEmailAdmin(String email) {
		if(userSession.getPerson().getAdmin().equals("1")) {
			Person person = personRepository.searchSpecificEntityValueIntoPerson("profile", "email", email.trim());
			if(person != null) {
				result.include("result", person);
			}else {
				result.include("message", "Not Found: "+email);
			}
			result.redirectTo(this).addadmin();
		}else {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	//Delete this person from db
	@Get("/adminDeletePerson/{code}")
	public void adminDeletePerson(String code) {
		if(userSession.getPerson().getAdmin().equals("1")) {
			Person person = personRepository.searchPersonId(code);
			personRepository.deletePerson(person);
			result.redirectTo(this).addadmin();
		}else {
			result.redirectTo(HomeController.class).home();
		}
	}
	
	@Get("/nerdzonia-set-superadmin")
	public void setAdmin() {
		Person person = personRepository.searchSpecificEntityValueIntoPerson("profile", "email", "nerdzonia@gmail.com");
		if(person.getAdmin().equals("0")) {
			person.setAdmin("1");
			personRepository.updatePerson(person);
			userSession.setLogged(false);
		}
			result.redirectTo(HomeController.class).home();
	}
}

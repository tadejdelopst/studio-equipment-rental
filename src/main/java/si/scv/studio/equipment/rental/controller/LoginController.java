package si.scv.studio.equipment.rental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import si.scv.studio.equipment.rental.dao.LocationDao;
import si.scv.studio.equipment.rental.dto.LocationDto;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.service.UserService;

import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {

    private final UserService userService;
    private final LocationDao locationDao;

    @Autowired
    public LoginController(UserService userService, LocationDao locationDao) {
        this.userService = userService;
        this.locationDao = locationDao;
    }

    @GetMapping(value={"/", "/login"})
    public ModelAndView login(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @GetMapping(value="/registration")
    public ModelAndView registration(){
        ModelAndView modelAndView = new ModelAndView();
        UserDto user = new UserDto();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @PostMapping(value = "/registration")
    public ModelAndView createNewUser(UserDto user, @RequestParam("image") MultipartFile multipartFile, BindingResult bindingResult) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        UserDto existingUser = userService.getUserByEmail(user.getEmail());
        if (existingUser != null) {
            bindingResult.rejectValue(
                    "userName",
                    "error.user",
                    "There is already a user registered with the user name provided.");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("registration");
        } else {
            if (multipartFile != null) {
                user.setProfileImage(multipartFile.getBytes());
            }
            userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully. Please Login!");
            modelAndView.addObject("user", new UserDto());
            modelAndView.setViewName("registration");

        }
        return modelAndView;
    }
}

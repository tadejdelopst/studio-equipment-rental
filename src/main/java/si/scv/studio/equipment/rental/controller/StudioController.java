package si.scv.studio.equipment.rental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import si.scv.studio.equipment.rental.dto.StudioDto;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.exception.UserStudioException;
import si.scv.studio.equipment.rental.service.EquipmentService;
import si.scv.studio.equipment.rental.service.RentalService;
import si.scv.studio.equipment.rental.service.StudioService;
import si.scv.studio.equipment.rental.service.UserService;

import java.util.Base64;
import java.util.List;

@Controller
public class StudioController {

    private final UserService userService;
    private final StudioService studioService;
    private final EquipmentService equipmentService;
    private final RentalService rentalService;

    @Autowired
    public StudioController(UserService userService, StudioService studioService, EquipmentService equipmentService, RentalService rentalService) {
        this.userService = userService;
        this.studioService = studioService;
        this.equipmentService = equipmentService;
        this.rentalService = rentalService;
    }

    private UserDto getAuthenticatedUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return userService.getUserByEmail(auth.getName());
    }

    @GetMapping(value = "/home/studio")
    public ModelAndView getUserStudioInformation() {
        ModelAndView modelAndView = new ModelAndView();

        UserDto user = getAuthenticatedUser();

        StudioDto studioDto = studioService.getStudioByUserEmail(user.getEmail());
        if (studioDto == null){
            modelAndView.setViewName("redirect:addUserStudio");
            return modelAndView;
        }

        modelAndView.addObject("userName", "Welcome " + user.getFirstName() + " " + user.getLastName());

        if (user.getProfileImage() != null) {
            modelAndView.addObject("profileImage", Base64.getEncoder().encodeToString(user.getProfileImage()));
        }
        modelAndView.addObject("studioEquipment", equipmentService.getStudioEquipment(studioDto.getId()));
        modelAndView.setViewName("home/studio");
        return modelAndView;
    }

    @GetMapping(value = "/home/addUserStudio")
    public ModelAndView getAddUserStudio() {
        ModelAndView modelAndView = new ModelAndView();

        UserDto user = getAuthenticatedUser();

        StudioDto studioDto = studioService.getStudioByUserEmail(user.getEmail());
        if (studioDto != null){
            throw new UserStudioException("User already has studio!");
        }

        if (user.getProfileImage() != null) {
            modelAndView.addObject("profileImage", Base64.getEncoder().encodeToString(user.getProfileImage()));
        }

        List<StudioDto> studios = studioService.getStudios();

        modelAndView.addObject("studios", studios);
        modelAndView.setViewName("/home/addUserStudio");
        return modelAndView;
    }

    @PostMapping(value = "/home/addUserStudio")
    public ModelAndView addUserStudio(Long studioId) {
        ModelAndView modelAndView = new ModelAndView();
        userService.addStudioToCurrentUser(studioId);
        modelAndView.setViewName("redirect:studio");
        return modelAndView;
    }
}

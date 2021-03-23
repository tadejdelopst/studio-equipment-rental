package si.scv.studio.equipment.rental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import si.scv.studio.equipment.rental.dao.LocationDao;
import si.scv.studio.equipment.rental.dto.EquipmentDto;
import si.scv.studio.equipment.rental.dto.LocationDto;
import si.scv.studio.equipment.rental.dto.StudioDto;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.exception.UserLocationException;
import si.scv.studio.equipment.rental.exception.UserStudioException;
import si.scv.studio.equipment.rental.service.*;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Controller
public class StudioController {

    private final UserService userService;
    private final StudioService studioService;
    private final EquipmentService equipmentService;
    private final RentalService rentalService;
    private final LocationService locationService;
    private final LocationDao locationDao;

    @Autowired
    public StudioController(UserService userService, StudioService studioService, EquipmentService equipmentService, RentalService rentalService, LocationService locationService, LocationDao locationDao) {
        this.userService = userService;
        this.studioService = studioService;
        this.equipmentService = equipmentService;
        this.rentalService = rentalService;
        this.locationService = locationService;
        this.locationDao = locationDao;
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

    @GetMapping(value = "/home/userPage")
    public ModelAndView getUserInformation() {
        ModelAndView modelAndView = new ModelAndView();
        UserDto user = getAuthenticatedUser();

        StudioDto studioDto = studioService.getStudioByUserEmail(user.getEmail());
        if (studioDto == null){
            modelAndView.setViewName("redirect:addUserStudio");
            return modelAndView;
        }

        LocationDto locationDto = locationService.getLocationByUserEmail(user.getEmail());
        if (locationDto == null){
            modelAndView.setViewName("redirect:addUserLocation");
            return modelAndView;
        }

        if (user.getProfileImage() != null) {
            modelAndView.addObject("profileImage", Base64.getEncoder().encodeToString(user.getProfileImage()));
        }
        modelAndView.addObject("studio",studioDto);
        modelAndView.addObject("user",user);
        modelAndView.addObject("location", locationDto);
        modelAndView.setViewName("home/userPage");
        return modelAndView;
    }

    @GetMapping(value = "/home/addUserLocation")
    public ModelAndView getAddUserLocation(){
        ModelAndView modelAndView = new ModelAndView();

        UserDto user = getAuthenticatedUser();
        LocationDto locationDto = locationService.getLocationByUserEmail(user.getEmail());
        if (locationDto != null){
            throw new UserLocationException("User location already selected!");
        }

        List<LocationDto> locations = locationDao.getAllLocations();

        modelAndView.addObject("locations", locations);
        modelAndView.setViewName("home/addUserLocation");
        return modelAndView;
    }

    @PostMapping(value = "/home/addUserLocation")
    public ModelAndView addUserLocation(Long locationId) {
        ModelAndView modelAndView = new ModelAndView();
        locationService.addLocationToCurrentUser(locationId);
        modelAndView.setViewName("redirect:userPage");
        return modelAndView;
    }

    @GetMapping(value = "/home/addStudioEquipment")
    public ModelAndView getAddStudioEquipment(){
        ModelAndView modelAndView = new ModelAndView();

        UserDto user = getAuthenticatedUser();

        StudioDto studioDto = studioService.getStudioByUserEmail(user.getEmail());
        if (studioDto == null){
            modelAndView.setViewName("redirect:addUserStudio");
            return modelAndView;
        }

        EquipmentDto equipment = new EquipmentDto();
        modelAndView.addObject("equipment", equipment);
        modelAndView.setViewName("home/addStudioEquipment");
        return modelAndView;
    }

    @PostMapping(value = "/home/addStudioEquipment")
    public ModelAndView createNewEquipmentDto(EquipmentDto equipment, BindingResult bindingResult) throws IOException {
        ModelAndView modelAndView = new ModelAndView();

        UserDto user = getAuthenticatedUser();

        StudioDto studioDto = studioService.getStudioByUserEmail(user.getEmail());
        if (studioDto == null){
            modelAndView.setViewName("redirect:addUserStudio");
            return modelAndView;
        }

        equipmentService.saveEquipment(equipment, user);
        modelAndView.setViewName("redirect:studio");
        return modelAndView;
    }
}

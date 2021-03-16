package si.scv.studio.equipment.rental.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.service.UserService;

import java.util.List;

@RestController
@RequestMapping("user")
public class UserRestController {

    private final UserService userService;

    @Autowired
    public UserRestController(UserService userService){
        this.userService = userService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public UserDto getUserByEmail(@RequestParam("email") String email){
        return userService.getUserByEmail(email);
    }

    @GetMapping(value = "/{fistName}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<UserDto> getUsersByFirstName(@PathVariable String firstName) {
        return userService.getUsersByFirstName(firstName);
    }
}

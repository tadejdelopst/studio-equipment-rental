package si.scv.studio.equipment.rental.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import si.scv.studio.equipment.rental.dto.StudioDto;
import si.scv.studio.equipment.rental.service.StudioService;

import java.util.List;

@RestController
@RequestMapping("studio")
public class StudioRestController {

    private final StudioService studioService;

    @Autowired
    public StudioRestController(StudioService studioService) {
        this.studioService = studioService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<StudioDto> getStudiosByUserEmail(@RequestParam("email") String email){
        return studioService.getStudiosByUserEmail(email);
    }

    @GetMapping(value = "/{lastName}",produces = MediaType.APPLICATION_JSON_VALUE)
    public List<StudioDto> getStudiosByUserLastName(@PathVariable String lastName){
        return studioService.getStudiosByUserLastName(lastName);
    }
}

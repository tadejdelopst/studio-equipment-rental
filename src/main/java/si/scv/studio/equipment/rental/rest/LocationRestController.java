package si.scv.studio.equipment.rental.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import si.scv.studio.equipment.rental.service.LocationService;

@RestController
@RequestMapping("location")
public class LocationRestController {
    private final LocationService locationService;

    @Autowired
    public LocationRestController(LocationService locationService) {
        this.locationService = locationService;
    }
}

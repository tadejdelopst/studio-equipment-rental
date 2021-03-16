package si.scv.studio.equipment.rental.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import si.scv.studio.equipment.rental.service.RentalService;

@RestController
@RequestMapping("rental")
public class RentalRestController {
    private final RentalService rentalService;

    @Autowired
    public RentalRestController(RentalService rentalService) {
        this.rentalService = rentalService;
    }
}

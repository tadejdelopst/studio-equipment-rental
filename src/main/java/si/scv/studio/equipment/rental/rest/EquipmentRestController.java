package si.scv.studio.equipment.rental.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import si.scv.studio.equipment.rental.service.EquipmentService;

@RestController
@RequestMapping("equipment")
public class EquipmentRestController {
    private final EquipmentService equipmentService;

    @Autowired
    public EquipmentRestController(EquipmentService equipmentService) {
        this.equipmentService = equipmentService;
    }
}

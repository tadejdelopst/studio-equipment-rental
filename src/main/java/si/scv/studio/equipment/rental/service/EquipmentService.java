package si.scv.studio.equipment.rental.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;

@Service
public class EquipmentService {
    private final EquipmentRepository equipmentRepository;

    @Autowired
    public EquipmentService(EquipmentRepository equipmentRepository){ this.equipmentRepository = equipmentRepository; }
}

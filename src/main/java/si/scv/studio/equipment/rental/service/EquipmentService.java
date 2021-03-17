package si.scv.studio.equipment.rental.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;
import si.scv.studio.equipment.rental.dto.EquipmentDto;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EquipmentService {
    private final EquipmentRepository equipmentRepository;

    @Autowired
    public EquipmentService(EquipmentRepository equipmentRepository) {
        this.equipmentRepository = equipmentRepository;
    }

    @Transactional(readOnly = true)
    public List<EquipmentDto> getStudioEquipment(Long studioId) {
        return equipmentRepository.getEquipmentForStudio(studioId).stream()
                .map(equipment -> new EquipmentDto(
                        equipment.getId(),
                        equipment.getName(),
                        equipment.getModel(),
                        equipment.getWarnings(),
                        equipment.getDescription(),
                        !equipment.getRentals().isEmpty()))
                .collect(Collectors.toList());
    }
}

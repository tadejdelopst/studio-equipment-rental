package si.scv.studio.equipment.rental.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ExpressionException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;
import si.scv.studio.equipment.rental.dto.EquipmentDto;
import si.scv.studio.equipment.rental.dto.StudioDto;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.model.Equipment;
import si.scv.studio.equipment.rental.model.Studio;
import si.scv.studio.equipment.rental.model.User;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EquipmentService {
    private final EquipmentRepository equipmentRepository;
    private final StudioService studioService;

    @Autowired
    public EquipmentService(EquipmentRepository equipmentRepository, StudioService studioService) {
        this.equipmentRepository = equipmentRepository;
        this.studioService = studioService;
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

    @Transactional
    public void saveEquipment(EquipmentDto equipmentDto, UserDto userDto){
        Equipment equipment = new Equipment();
        StudioDto studioDto = studioService.getStudioByUserEmail(userDto.getEmail());
        Studio studio = studioService.getStudioByName(studioDto.getName());
        equipment.setName(equipmentDto.getName());
        equipment.setModel(equipmentDto.getModel());
        equipment.setDescription(equipmentDto.getDescription());
        equipment.setWarnings(equipmentDto.getWarnings());
        equipment.setStudio(studio);
        equipmentRepository.save(equipment);
    }

    @Transactional(readOnly = true)
    public EquipmentDto getEquipmentByName(String name){
        Equipment equipment = equipmentRepository.findByName(name);
        return equipment == null ?
                null :
                new EquipmentDto(
                        equipment.getId(),
                        equipment.getName(),
                        equipment.getWarnings(),
                        equipment.getDescription(),
                        equipment.getWarnings(),
                        false);
    }


    @Transactional
    public void addCurrentStudioToEquipment(Long equipmentId, StudioDto studioDto) {
        Studio studio = studioService.getStudioByName(studioDto.getName());

            Equipment equipment = equipmentRepository.findById(equipmentId)
                    .orElseThrow(() -> new ExpressionException("Location with id " + equipmentId + " not found!"));
            equipment.setStudio(studio);
    }
}

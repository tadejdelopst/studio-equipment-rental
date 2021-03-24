package si.scv.studio.equipment.rental.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.EquipmentDao;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;
import si.scv.studio.equipment.rental.dto.EquipmentDto;
import si.scv.studio.equipment.rental.dto.StudioDto;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.model.Equipment;
import si.scv.studio.equipment.rental.model.Studio;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EquipmentService {
    private final EquipmentRepository equipmentRepository;
    private final StudioService studioService;
    private final EquipmentDao equipmentDao;

    @Autowired
    public EquipmentService(EquipmentRepository equipmentRepository, StudioService studioService, EquipmentDao equipmentDao) {
        this.equipmentRepository = equipmentRepository;
        this.studioService = studioService;
        this.equipmentDao = equipmentDao;
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

    @Transactional(readOnly = true)
    public List<EquipmentDto> getUnRentedStudioEquipment(Long studioId){
        return getStudioEquipment(studioId).stream()
                .filter(equipmentDto -> !equipmentDto.isRented())
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

    @Transactional
    public void deleteEquipment(Long equipmentId){
        Equipment equipment = equipmentRepository.findById(equipmentId)
                .orElseThrow(() -> new IllegalStateException("Equipment with id " + equipmentId + " not found!"));
        equipmentRepository.delete(equipment);
    }

}

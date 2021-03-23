package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.StudioRepository;
import si.scv.studio.equipment.rental.dto.StudioDto;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.exception.UserStudioException;
import si.scv.studio.equipment.rental.model.Studio;
import si.scv.studio.equipment.rental.model.User;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class StudioService {

    private final StudioRepository studioRepository;

    @Autowired
    public StudioService(StudioRepository studioRepository){
        this.studioRepository = studioRepository;
    }

    @Transactional(readOnly = true)
    public StudioDto getStudioByUserEmail(String email){
        List<Studio> studios = studioRepository.getStudiosByUserEmail(email);
        if (studios.isEmpty()){
            return null;
        } else if (studios.size() == 1) {
            Studio studio = studios.get(0);
            return new StudioDto(studio.getId(), studio.getName(), studio.getAddress(),studio.getEmail());
        } else {
            throw new UserStudioException("User cannot have more than one studio!");
        }
    }

    @Transactional(readOnly = true)
    public Studio getStudioByName(String name){
        Studio studio = studioRepository.findByName(name);
        return studio;
    }

    @Transactional(readOnly = true)
    public List<StudioDto> getStudios() {
        return studioRepository.findAll(Sort.by("name")).stream()
                .map(studio -> new StudioDto(studio.getId(), studio.getName(), studio.getAddress(), studio.getEmail()))
                .collect(Collectors.toList());
    }
}

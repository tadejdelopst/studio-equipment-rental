package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.StudioRepository;
import si.scv.studio.equipment.rental.dto.StudioDto;

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
    public List<StudioDto> getStudiosByUserEmail(String email){
        return studioRepository.getStudiosByUserEmail(email).stream()
                .map(studio -> new StudioDto(studio.getName(), studio.getAddress(), studio.getEmail()))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<StudioDto> getStudiosByUserLastName(String lastName){
        return studioRepository.getStudiosByUserLastName(lastName).stream()
                .map(studio -> new StudioDto(studio.getName(), studio.getAddress(),studio.getEmail()))
                .collect(Collectors.toList());
    }
}

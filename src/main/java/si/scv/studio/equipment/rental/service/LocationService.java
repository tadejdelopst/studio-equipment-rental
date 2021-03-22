package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;
import si.scv.studio.equipment.rental.dao.LocationRepository;
import si.scv.studio.equipment.rental.dto.LocationDto;
import si.scv.studio.equipment.rental.dto.StudioDto;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LocationService {
        private final LocationRepository locationRepository;

        @Autowired
        public LocationService(LocationRepository locationRepository){ this.locationRepository = locationRepository; }

}

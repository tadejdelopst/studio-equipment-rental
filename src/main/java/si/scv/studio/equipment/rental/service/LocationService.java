package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;
import si.scv.studio.equipment.rental.dao.LocationRepository;

@Service
public class LocationService {
        private final LocationRepository locationRepository;

        @Autowired
        public LocationService(LocationRepository locationRepository){ this.locationRepository = locationRepository; }
}

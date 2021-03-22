package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.LocationRepository;
import si.scv.studio.equipment.rental.dao.UserRepository;
import si.scv.studio.equipment.rental.dto.LocationDto;
import si.scv.studio.equipment.rental.exception.UserStudioException;
import si.scv.studio.equipment.rental.model.Location;
import si.scv.studio.equipment.rental.model.User;

import java.util.List;

@Service
public class LocationService {
        private final LocationRepository locationRepository;
        private final UserRepository userRepository;


        @Autowired
        public LocationService(LocationRepository locationRepository, UserRepository userRepository){ this.locationRepository = locationRepository;
                this.userRepository = userRepository;
        }

        @Transactional(readOnly = true)
        public LocationDto getLocationByUserEmail(String email){
                List<Location> locations = locationRepository.getLocationsByUserEmail(email);
                if (locations.isEmpty()){
                        return null;
                } else if (locations.size() == 1) {
                        Location location = locations.get(0);
                        return new LocationDto(location.getId(),location.getName(),location.getPost());
                } else {
                        throw new UserStudioException("User cannot have more than one studio!");
                }
        }

        @Transactional
        public void addLocationToCurrentUser(Long locationId) {
                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                User existingUser = userRepository.findByEmail(auth.getName());
                if(existingUser == null){
                        throw new UsernameNotFoundException("User with username " + auth.getName() + " not found!");
                } else {
                        Location location = locationRepository.findById(locationId)
                                .orElseThrow(() -> new UserStudioException("Location with id " + locationId + " not found!"));
                        existingUser.setLocation(location);
                }
        }
}

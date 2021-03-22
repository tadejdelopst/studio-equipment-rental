package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.LocationRepository;
import si.scv.studio.equipment.rental.dao.StudioRepository;
import si.scv.studio.equipment.rental.dao.UserRepository;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.exception.UserStudioException;
import si.scv.studio.equipment.rental.model.Location;
import si.scv.studio.equipment.rental.model.Studio;
import si.scv.studio.equipment.rental.model.User;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final StudioRepository studioRepository;
    private final LocationRepository locationRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, StudioRepository studioRepository, LocationRepository locationRepository, BCryptPasswordEncoder bCryptPasswordEncoder){
        this.userRepository = userRepository;
        this.studioRepository = studioRepository;
        this.locationRepository = locationRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Transactional(readOnly = true)
    public UserDto getUserByEmail(String email){
        User user = userRepository.findByEmail(email);
        return user == null ?
                null :
                new UserDto(
                        user.getFirstName(),
                        user.getLastName(),
                        user.getEmail(),
                        user.getPass(),
                        user.getProfileImage());
    }


    @Transactional
    public void saveUser(UserDto userDto){
        User user = new User();
        user.setEmail(userDto.getEmail());
        user.setPass(bCryptPasswordEncoder.encode(userDto.getPassword()));
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setProfileImage(userDto.getProfileImage());
        userRepository.save(user);
    }

    @Transactional
    public void updateUser(UserDto userDto){
        User existingUser = userRepository.findByEmail(userDto.getEmail());
        if(existingUser == null){
            throw new UsernameNotFoundException("User with username " + userDto.getEmail() + " not found!");
        } else {
            existingUser.setLastName(userDto.getLastName());
            existingUser.setFirstName(userDto.getFirstName());
            existingUser.setEmail(userDto.getEmail());
        }
    }

    @Transactional
    public void addStudioToCurrentUser(Long studioId) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User existingUser = userRepository.findByEmail(auth.getName());

        if(existingUser == null){
            throw new UsernameNotFoundException("User with username " + auth.getName() + " not found!");
        } else {
            Studio studio = studioRepository.findById(studioId)
                    .orElseThrow(() -> new UserStudioException("Studio with id " + studioId + " not found!"));

            existingUser.setStudio(studio);
        }


    }
}

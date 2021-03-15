package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.UserRepository;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.model.User;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }

    @Transactional(readOnly = true)
    public UserDto getUserByEmail(String email){
        User user = userRepository.findByEmail(email);
        if (user == null){
            throw new IllegalStateException("User with email " + email + " not found!");
        }
        else {
            return new UserDto(user.getFirstName(), user.getLastName(), user.getEmail());
        }
    }

    @Transactional(readOnly = true)
    public List<UserDto> getUsersByFirstName(String firstName){
        return userRepository.findAllByFirstName(firstName).stream()
                .map(user -> new UserDto(user.getFirstName(), user.getLastName(),user.getEmail()))
                .collect(Collectors.toList());
    }
}

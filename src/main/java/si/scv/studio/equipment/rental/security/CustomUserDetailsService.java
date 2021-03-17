package si.scv.studio.equipment.rental.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.service.UserService;

import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    @Autowired
    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDto userDto = userService.getUserByEmail(username);

        if (userDto == null) {
            throw new UsernameNotFoundException("User with username " + username + " not found!");
        }
        return new User(
                userDto.getEmail(),
                userDto.getPassword(),
                true,
                true,
                true,
                true,
                Collections.emptyList());
    }
}

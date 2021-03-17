package si.scv.studio.equipment.rental.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class StudioDto {

    private final Long id;
    private final String name;
    private final String address;
    private final String email;

    public StudioDto(Long id, String name, String address, String email) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }
}

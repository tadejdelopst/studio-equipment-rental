package si.scv.studio.equipment.rental.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(allowSetters = true, value = {"rented"})
public class EquipmentDto {

    private Long id;
    private String name;
    private String model;
    private String warnings;
    private String description;
    private boolean rented;

    public EquipmentDto(){

    }

    public EquipmentDto(Long id, String name, String model){
        this.id = id;
        this.name = name;
        this.model = model;
    }

    public EquipmentDto(Long id, String name, String model, String warnings, String description, boolean rented){
        this.id = id;
        this.name = name;
        this.model = model;
        this.warnings = warnings;
        this.description = description;
        this.rented = rented;
    }

    public Long getId() {
        return id;
    }

    public String getName() { return name; }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setWarnings(String warnings) {
        this.warnings = warnings;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRented(boolean rented) {
        this.rented = rented;
    }

    public String getModel() { return model; }

    public String getWarnings() { return warnings; }

    public String getDescription() { return description; }

    public boolean isRented() {
        return rented;
    }
}


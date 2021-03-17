package si.scv.studio.equipment.rental.dto;

public class EquipmentDto {

    private final Long id;
    private final String name;
    private final String model;
    private final String warnings;
    private final String description;
    private final boolean rented;

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

    public String getModel() { return model; }

    public String getWarnings() { return warnings; }

    public String getDescription() { return description; }

    public boolean isRented() {
        return rented;
    }
}


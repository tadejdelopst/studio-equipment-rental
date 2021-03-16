package si.scv.studio.equipment.rental.dto;

public class EquipmentDto {

    private final String name;

    private final String model;

    private final String warnings;

    private final String description;

    public EquipmentDto(String _name, String _model, String _warnings, String _description){
        this.name = _name;
        this.model = _model;
        this.warnings = _warnings;
        this.description = _description;
    }

    public String getName() { return name; }

    public String getModel() { return model; }

    public String getWarnings() { return warnings; }

    public String getDescription() { return description; }
}

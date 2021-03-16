package si.scv.studio.equipment.rental.dto;

public class LocationDto {

    private final String name;

    private final String post;

    public String getName() { return name; }

    public String getPost() { return post; }

    public LocationDto(String _name, String _post){
        this.name = _name;
        this.post = _post;
    }
}

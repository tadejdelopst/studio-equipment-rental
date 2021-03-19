package si.scv.studio.equipment.rental.dto;

public class LocationDto {

    private final Long id;
    private final String name;
    private final String post;

    public LocationDto(Long id, String name, String post){
        this.id = id;
        this.name = name;
        this.post = post;
    }

    public Long getId() {
        return id;
    }

    public String getName() { return name; }

    public String getPost() { return post; }
}

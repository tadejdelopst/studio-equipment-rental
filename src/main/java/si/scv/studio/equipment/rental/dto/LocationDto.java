package si.scv.studio.equipment.rental.dto;

public class LocationDto {

    private Long id;
    private String name;
    private String post;

    public LocationDto(Long id, String name, String post){
        this.id = id;
        this.name = name;
        this.post = post;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public Long getId() {
        return id;
    }

    public String getName() { return name; }

    public String getPost() { return post; }
}

package si.scv.studio.equipment.rental.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "locations")
public class Location {
    @Id
    @GeneratedValue(generator = "hibseq")
    @GenericGenerator(
            name = "hibseq",
            strategy = "enhanced-sequence",
            parameters = {
                    @Parameter(name = "sequence_name", value = "hibseq"),
                    @Parameter(name = "increment_size", value = "50"),
                    @Parameter(name = "initial_value", value = "100")
            }
    )
    private Long id;

    private String name;

    private String post;

    @OneToMany(mappedBy = "location", fetch = FetchType.LAZY)
    private List<User> users;

    @OneToMany(mappedBy = "location", fetch = FetchType.LAZY)
    private List<Studio> studios;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getPost() { return post; }

    public void setPost(String post) { this.post = post; }

    public List<User> getUsers() { return users; }

    public void setUsers(List<User> users) { this.users = users; }

    public List<Studio> getStudios() { return studios; }

    public void setStudios(List<Studio> studios) { this.studios = studios; }
}

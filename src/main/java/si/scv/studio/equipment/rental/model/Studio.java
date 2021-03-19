package si.scv.studio.equipment.rental.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "studios")
public class Studio {
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

    private String address;

    private String email;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;

    @OneToMany(mappedBy = "studio", fetch = FetchType.LAZY)
    private List<User> users;

    @OneToMany(mappedBy = "studio", fetch = FetchType.LAZY)
    private List<Equipment> equipments;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }

    public void setAddress(String address) { this.address = address; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public Location getLocation() { return location; }

    public void setLocation(Location location) { this.location = location; }

    public List<User> getUsers() { return users; }

    public void setUsers(List<User> users) { this.users = users; }

    public List<Equipment> getEquipments() { return equipments; }

    public void setEquipments(List<Equipment> equipments) { this.equipments = equipments; }
}

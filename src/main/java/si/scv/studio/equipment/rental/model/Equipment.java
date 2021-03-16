package si.scv.studio.equipment.rental.model;


import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "equipments")
public class Equipment {
    @Id
    @GeneratedValue(generator = "hibseq")
    @GenericGenerator(
            name = "hibseq",
            strategy = "enhanced-sequence",
            parameters = {
                    @Parameter(name = "sequence_name", value = "hibseq"),
                    @Parameter(name = "increment_size", value = "50"),
                    @Parameter(name = "initial_value", value = "1")
            }
    )
    private Long id;

    private String name;

    private String model;

    private String warnings;

    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studio_id", nullable = false)
    private Studio studio;

    @OneToMany(mappedBy = "equipment", fetch = FetchType.LAZY)
    private List<Rental> rentals;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getModel() { return model; }

    public void setModel(String model) { this.model = model; }

    public String getWarnings() { return warnings; }

    public void setWarnings(String warnings) { this.warnings = warnings; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public Studio getStudio() { return studio; }

    public void setStudio(Studio studio) { this.studio = studio; }

    public List<Rental> getRentals() { return rentals; }

    public void setRentals(List<Rental> rentals) { this.rentals = rentals; }
}

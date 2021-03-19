package si.scv.studio.equipment.rental.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "rentals")
public class Rental {
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

    private Date rental_date;

    private  Date return_date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "equipment_id", nullable = false)
    private Equipment equipment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public Date getRental_date() { return rental_date; }

    public void setRental_date(Date rental_date) { this.rental_date = rental_date; }

    public Date getReturn_date() { return return_date; }

    public void setReturn_date(Date return_date) { this.return_date = return_date; }

    public Equipment getEquipment() { return equipment; }

    public void setEquipment(Equipment equipment) { this.equipment = equipment; }

    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }
}

package si.scv.studio.equipment.rental.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import si.scv.studio.equipment.rental.model.Equipment;
import si.scv.studio.equipment.rental.model.Rental;
import si.scv.studio.equipment.rental.model.User;

@Repository
public interface RentalRepository extends JpaRepository<Rental, Long> {
    Rental findByEquipment(Equipment equipment);
}

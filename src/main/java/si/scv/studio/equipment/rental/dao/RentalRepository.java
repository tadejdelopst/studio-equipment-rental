package si.scv.studio.equipment.rental.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import si.scv.studio.equipment.rental.model.Rental;

@Repository
public interface RentalRepository extends JpaRepository<Rental, Long> {
}

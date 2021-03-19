package si.scv.studio.equipment.rental.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import si.scv.studio.equipment.rental.model.Location;

import java.util.List;

@Repository
public interface LocationRepository extends JpaRepository<Location, Long> {
}

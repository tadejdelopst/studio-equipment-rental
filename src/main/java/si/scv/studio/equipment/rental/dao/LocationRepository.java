package si.scv.studio.equipment.rental.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import si.scv.studio.equipment.rental.model.Location;
import si.scv.studio.equipment.rental.model.Studio;

import java.util.List;

@Repository
public interface LocationRepository extends JpaRepository<Location, Long> {
    @Query("select s from User u join u.location s where u.email = :email")
    List<Location> getLocationsByUserEmail(String email);
}

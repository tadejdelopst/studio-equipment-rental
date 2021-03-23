package si.scv.studio.equipment.rental.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import si.scv.studio.equipment.rental.model.Studio;
import si.scv.studio.equipment.rental.model.User;

import java.util.List;

@Repository
public interface StudioRepository extends JpaRepository<Studio, Long> {
    @Query("select s from User u join u.studio s where u.email = :email")
    List<Studio> getStudiosByUserEmail(String email);

    Studio findByName(String name);
}

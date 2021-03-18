package si.scv.studio.equipment.rental.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import si.scv.studio.equipment.rental.model.Equipment;

import java.util.List;

@Repository
public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
    @Query("select e from Equipment e join e.studio s where s.id = :id")
    List<Equipment> getEquipmentForStudio(Long id);
}

package si.scv.studio.equipment.rental.dao;

import org.springframework.stereotype.Component;
import si.scv.studio.equipment.rental.dto.EquipmentDto;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.math.BigInteger;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class EquipmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public List<EquipmentDto> getAllEquipmentForDelete(){
        StoredProcedureQuery procedureQuery = entityManager.createStoredProcedureQuery("FIND_ALL_EQUIPMENT_FOR_DELETE");
        procedureQuery.execute();
        List<Object[]> results = procedureQuery.getResultList();
        return results.stream()
                .map(result -> new EquipmentDto(((BigInteger)result[0]).longValue(), (String)result[1], (String)result[2]))
                .sorted(Comparator.comparing(EquipmentDto::getName))
                .collect(Collectors.toList());
    }
}

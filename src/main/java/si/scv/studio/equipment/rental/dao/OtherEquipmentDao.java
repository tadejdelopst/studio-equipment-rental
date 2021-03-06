package si.scv.studio.equipment.rental.dao;

import org.springframework.stereotype.Component;
import si.scv.studio.equipment.rental.dto.EquipmentDto;
import si.scv.studio.equipment.rental.dto.RentalDto;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.math.BigInteger;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class OtherEquipmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public List<EquipmentDto> getAllOtherUnRentedEquipment(Long studioId){
        Integer param = studioId.intValue();
        StoredProcedureQuery procedureQuery = entityManager.createStoredProcedureQuery("FIND_ALL_EQUIPMENT_NOT_RENTED");
        procedureQuery.registerStoredProcedureParameter(param, Integer.class, ParameterMode.IN);
        procedureQuery.setParameter(1, param);
        procedureQuery.execute();
        List<Object[]> results = procedureQuery.getResultList();
        return results.stream()
                .map(result -> new EquipmentDto(((BigInteger)result[0]).longValue(), (String)result[1], (String)result[2]))
                .sorted(Comparator.comparing(EquipmentDto::getName))
                .collect(Collectors.toList());
    }

    @SuppressWarnings("unchecked")
    public List<EquipmentDto> getStudioRentedEquipment(Long studioId){
        Integer param = studioId.intValue();
        StoredProcedureQuery procedureQuery = entityManager.createStoredProcedureQuery("FIND_STUDIO_RENTED_EQUIPMENT");
        procedureQuery.registerStoredProcedureParameter(param, Integer.class, ParameterMode.IN);
        procedureQuery.setParameter(1, param);
        procedureQuery.execute();
        List<Object[]> results = procedureQuery.getResultList();
        return results.stream()
                .map(result -> new EquipmentDto(((BigInteger)result[0]).longValue(), (String)result[1], (String)result[2]))
                .sorted(Comparator.comparing(EquipmentDto::getName))
                .collect(Collectors.toList());
    }
}
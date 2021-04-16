package si.scv.studio.equipment.rental.dao;

import org.springframework.stereotype.Component;
import si.scv.studio.equipment.rental.dto.EquipmentDto;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.math.BigInteger;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class RentalDao {
    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public void deleteRental(Long equipmentID){
        Integer param = equipmentID.intValue();
        StoredProcedureQuery procedureQuery = entityManager.createStoredProcedureQuery("DELETE_RENTAL");
        procedureQuery.registerStoredProcedureParameter(param, Integer.class, ParameterMode.IN);
        procedureQuery.setParameter(1, param);
        procedureQuery.execute();
    }

}

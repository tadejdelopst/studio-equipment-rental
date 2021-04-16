package si.scv.studio.equipment.rental.service;

import org.flywaydb.core.internal.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import si.scv.studio.equipment.rental.dao.EquipmentRepository;
import si.scv.studio.equipment.rental.dao.RentalRepository;
import si.scv.studio.equipment.rental.dao.UserRepository;
import si.scv.studio.equipment.rental.dto.UserDto;
import si.scv.studio.equipment.rental.model.Equipment;
import si.scv.studio.equipment.rental.model.Rental;
import si.scv.studio.equipment.rental.model.User;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Service
public class RentalService {
    private final RentalRepository rentalRepository;
    private final EquipmentRepository equipmentRepository;
    private final UserRepository userRepository;


    @Autowired
    public RentalService(RentalRepository rentalRepository, EquipmentRepository equipmentRepository, UserRepository userRepository){ this.rentalRepository = rentalRepository;
        this.equipmentRepository = equipmentRepository;
        this.userRepository = userRepository;
    }

    @Transactional
    public void saveRental(Long equipmentId, UserDto userAuth){
        Date rentalDate = new Date();

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, +1);
        Date returnDate = cal.getTime();

        Equipment equipment = equipmentRepository.findById(equipmentId)
                .orElseThrow(() -> new IllegalStateException("Equipment with id " + equipmentId + " not found!"));
        User user = userRepository.findByEmail(userAuth.getEmail());
        Rental rental = new Rental();
        rental.setEquipment(equipment);
        rental.setUser(user);
        rental.setRental_date(rentalDate);
        rental.setReturn_date(returnDate);
        rentalRepository.save(rental);
    }

    @Transactional
    public void deleteRental(Long equipmentId){
        Equipment equipment = equipmentRepository.findById(equipmentId)
                .orElseThrow(() -> new IllegalStateException("Equipment with id " + equipmentId + " not found!"));
        Rental rental = rentalRepository.findByEquipment(equipment);
        rentalRepository.delete(rental);
    }

}

package si.scv.studio.equipment.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import si.scv.studio.equipment.rental.dao.LocationRepository;
import si.scv.studio.equipment.rental.dao.RentalRepository;

@Service
public class RentalService {
    private final RentalRepository rentalRepository;

    @Autowired
    public RentalService(RentalRepository rentalRepository){ this.rentalRepository = rentalRepository; }
}

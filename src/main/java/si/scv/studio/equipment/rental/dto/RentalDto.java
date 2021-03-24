package si.scv.studio.equipment.rental.dto;

import java.util.Date;

public class RentalDto {
    private final Long id;
    private final Date rental_date;

    private final  Date return_date;

    public RentalDto(Long id, Date rental_date, Date return_date){
        this.id = id;
        this.rental_date = rental_date;
        this.return_date = return_date;
    }
}

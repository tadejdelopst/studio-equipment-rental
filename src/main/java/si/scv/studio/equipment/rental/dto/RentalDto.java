package si.scv.studio.equipment.rental.dto;

import java.util.Date;

public class RentalDto {
    private final Date rental_date;

    private final  Date return_date;

    public RentalDto(Date rental_date, Date return_date){
        this.rental_date = rental_date;
        this.return_date = return_date;
    }
}

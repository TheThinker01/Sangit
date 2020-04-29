package Bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Music {

    @Id
    @GeneratedValue
    private long id;

}

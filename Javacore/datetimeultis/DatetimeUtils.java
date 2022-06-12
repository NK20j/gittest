package datetimeultis;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class DatetimeUtils {
	
	public static LocalDateTime formatDate (LocalDateTime date, String pattern) {
		DateFormat Date = DateFormat.getDateInstance();
		return date;
	
	};
	public static LocalDateTime createDate(String date, String pattern) {
		 LocalDate date1 = LocalDate.now();
		return null;
		
	};
	public String convertDate(String date, String fromPattern, String toPattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(fromPattern);
        Date currentdate;
        String converted = "";
        try {
            currentdate = sdf.parse(date);
           
			SimpleDateFormat sdf2 = new SimpleDateFormat(toPattern);
            converted = sdf2.format(currentdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return converted;
    }
	
}

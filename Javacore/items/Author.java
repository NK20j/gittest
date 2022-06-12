package items;

import java.util.Date;

public class Author {

	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String email;
	private Date birthdate;
	private Date added;
	
	public Author(String username, String password, String firstname, String lastname, String email, Date birthdate, Date added) {
		this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname  = lastname;
        this.email  = email;
        this.birthdate  = birthdate;
        this.added  = added;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	public static Object contains(String author) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
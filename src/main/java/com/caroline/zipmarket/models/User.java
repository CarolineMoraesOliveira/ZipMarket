package com.caroline.zipmarket.models;

import java.util.List;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;


	@Entity
	@Table(name="users")
	public class User {
	    
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    
	    @NotBlank(message="Username is required!")
	    @Size(min=3, max=30, message="Username must be between 3 and 30 characters")
	    private String userName;
	    
	    @NotBlank(message="First name is required!")
	    @Size(min=3, max=50, message="First name and last name must be between 3 and 30 characters")
	    private String name;
	    
	    @NotBlank(message="Email is required!")
	    @Email(message="Please enter a valid email!")
	    private String email;
	    
	    @NotBlank(message="Password is required!")
	    @Size(min=6, max=128, message="Password must be between 6 and 128 characters")
	    private String password;
	    
	    @Pattern(regexp = "\\d{5}", message = "ZipCode Format is invalid")
	    private String zipCode;
	    
	    @Transient
	    @NotBlank(message="Confirm Password is required!")
	    @Size(min=6, max=128, message="Confirm Password must be between 8 and 128 characters")
	    private String confirm;
	    
	    // RELATIONSHIP
	    
	    @OneToMany(mappedBy="personWhoIsGoingToDonate", fetch=FetchType.LAZY)
	    private List<ThingToBeDonated> thingToBeDonate;

	    // Constructors
	    
	    public User () {
	
	}

		public User(Long id,
				@NotBlank(message = "Username is required!") @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters") String userName,
				@NotBlank(message = "First name is required!") @Size(min = 3, max = 50, message = "First name and last name must be between 3 and 30 characters") String name,
				@NotBlank(message = "Email is required!") @Email(message = "Please enter a valid email!") String email,
				@NotBlank(message = "Password is required!") @Size(min = 6, max = 128, message = "Password must be between 6 and 128 characters") String password,
				@Pattern(regexp = "\\d{5}", message = "ZipCode Format is invalid") String zipCode,
				@NotBlank(message = "Confirm Password is required!") @Size(min = 6, max = 128, message = "Confirm Password must be between 8 and 128 characters") String confirm,
				List<ThingToBeDonated> thingToBeDonate) {
			this.id = id;
			this.userName = userName;
			this.name = name;
			this.email = email;
			this.password = password;
			this.zipCode = zipCode;
			this.confirm = confirm;
			this.thingToBeDonate = thingToBeDonate;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getZipCode() {
			return zipCode;
		}

		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}

		public String getConfirm() {
			return confirm;
		}

		public void setConfirm(String confirm) {
			this.confirm = confirm;
		}

		public List<ThingToBeDonated> getThingToBeDonate() {
			return thingToBeDonate;
		}

		public void setThingToBeDonate(List<ThingToBeDonated> thingToBeDonate) {
			this.thingToBeDonate = thingToBeDonate;
		}
		
		
		
	}
	

package com.caroline.zipmarket.models;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="things_to_be_donated")
public class ThingToBeDonated {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message="The article name is required!")
    @Size(min=2, max=50, message="The article name must be between 2 and 50 characters")
    private String articleName;
    
    @NotEmpty(message="The article description can not be empty")
    @Size(min=1, max=255, message="The description must have between 1 and 255 characters")
    private String description;
    
    @Lob
    @Column (nullable = false, columnDefinition = "MediumBlob")
    private byte[] articleImage;
    
    @Column(updatable=false)
    private Date createdAt;
    
    @PrePersist
    protected void onCreate() {
    	 this.createdAt= new Date();
    }
    
    @Column(updatable=false)
    private Date updatedAt;

    @PreUpdate
    protected void onUpdate() {
    	this.setUpdatedAt(new Date());
    }
    
    // RELATIONSHIP
    
    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinColumn(name="user_id")
    private User personWhoIsGoingToDonate;
   

    // CONSTRUCTORS
    
    public ThingToBeDonated ()	{
    	
    }

	public ThingToBeDonated(Long id,
			@NotBlank(message = "The article name is required!") @Size(min = 2, max = 50, message = "The article name must be between 2 and 50 characters") String articleName,
			@NotEmpty(message = "The article description can not be empty") @Size(min = 1, max = 255, message = "The description must have between 1 and 255 characters") String description,
			byte[] articleImage, Date createdAt, Date updatedAt, User personWhoIsGoingToDonate) {
		
		this.id = id;
		this.articleName = articleName;
		this.description = description;
		this.articleImage = articleImage;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.personWhoIsGoingToDonate = personWhoIsGoingToDonate;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getArticleName() {
		return articleName;
	}

	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getArticleImage() {
		return articleImage;
	}

	public void setArticleImage(byte[] articleImage) {
		this.articleImage = articleImage;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getPersonWhoIsGoingToDonate() {
		return personWhoIsGoingToDonate;
	}

	public void setPersonWhoIsGoingToDonate(User personWhoIsGoingToDonate) {
		this.personWhoIsGoingToDonate = personWhoIsGoingToDonate;
	}

  public String getBase64Image() {
	        if (articleImage != null) {
	        	 try {
	                 Blob blob = new javax.sql.rowset.serial.SerialBlob(articleImage);
	                 byte[] bytes = blob.getBytes(1, (int) blob.length());
	                 String base64Image = Base64.getEncoder().encodeToString(bytes);
	                 System.out.println("Base64 Image: " + base64Image);
	                 return base64Image;
	             } catch (SQLException e) {
	                 e.printStackTrace();
	             }
	        }
	        return null; 
	    }



	public void setBase64Image(String base64Image) {
		 if (base64Image != null && !base64Image.isEmpty()) {
		       
		        this.articleImage = Base64.getDecoder().decode(base64Image);
		    } else {
		        this.articleImage = null;
		    }
		
	}


}


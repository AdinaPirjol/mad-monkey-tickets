/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author adina.pirjol
 */
@Entity
public class Event implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String name;
    
    private String shortDescription;
    
    @Lob
    @Column(length=2000)
    private String description;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Calendar startDate;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Calendar endDate;
    
    @OneToOne(cascade = CascadeType.PERSIST)
    private Location location;
    
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Category category;
    
    @OneToMany(mappedBy = "event", cascade = CascadeType.PERSIST)
    private List<EventTicket> eventTickets;
    
    public String getDateString() {
        if(this.getDay(startDate) != this.getDay(endDate) 
                && this.getMonth(startDate) != this.getMonth(endDate)) {
            return this.getStartDateStringB();
        } else {
            return this.getStartDateString();
        }
    }

    public String getStartDateString() {
        String day = this.getDay(startDate);
        int m = this.getMonth(startDate);
        String month = new DateFormatSymbols().getMonths()[m-1];
        String year = this.getYear(startDate);
        
        String date = day + " " + month + ", " + year;
        return date;
    }
    
    public String getStartDateStringB() {
        String day = this.getDay(startDate);
        String day2 = this.getDay(endDate);
        int m = this.getMonth(startDate);
        String month = new DateFormatSymbols().getMonths()[m-1];
        String year = this.getYear(startDate);
        
        String date = day + "-" + day2 + " " + month + ", " + year;
        return date;
    }
    
    public String getDay(Calendar cal) {
        return cal.get(Calendar.DAY_OF_WEEK_IN_MONTH)+"";
    }
    
    public String getHour(Calendar cal) {
        return cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE);
    }
    
    public int getMonth(Calendar cal) {
        return cal.get(Calendar.MONTH);
    }
    
    public String getYear(Calendar cal) {
        return cal.get(Calendar.YEAR)+"";
    }
    
    public Calendar getStartDate() {
        return startDate;
    }

    public void setStartDate(Calendar startDate) {
        this.startDate = startDate;
    }

    public Calendar getEndDate() {
        return endDate;
    }

    public void setEndDate(Calendar endDate) {
        this.endDate = endDate;
    }
    
    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public List<EventTicket> getEventTickets() {
        return eventTickets;
    }

    public void setEventTickets(List<EventTicket> eventTickets) {
        this.eventTickets = eventTickets;
    }
    
    public void addTicket(EventTicket t){
        this.eventTickets.add(t);
    }
    
    public void removeTicket(EventTicket t){
        this.eventTickets.remove(t);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Event)) {
            return false;
        }
        Event other = (Event) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Event[ id=" + id + " ]";
    }
    
}

package com.bogyo.freelancer.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.geo.Point;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "sources")
public class Source {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "source_id")
    private long id;

    @Column(name = "location")
    private String location;

    @OneToOne
    @JoinColumn(name = "fk_owner", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User owner;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Source)) return false;
        Source source = (Source) obj;
        return this.id == source.id && this.location.equals(source.location);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, location, owner);
    }
}

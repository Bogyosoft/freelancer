package com.bogyo.freelancer.model;

import com.bogyo.freelancer.enums.ItemStatus;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id")
    private long id;

    @Column(name = "properties")
    private String properties;

    @Column(name = "destination")
    private String destination;

    @Column(name = "status")
    private ItemStatus status;

    @OneToOne
    @JoinColumn(name = "fk_source", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Source source;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProperties() {
        return properties;
    }

    public void setProperties(String properties) {
        this.properties = properties;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public ItemStatus getStatus() {
        return status;
    }

    public void setStatus(ItemStatus status) {
        this.status = status;
    }

    public Source getSource() {
        return source;
    }

    public void setSource(Source source) {
        this.source = source;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Item)) return false;
        Item item = (Item) obj;
        return this.id == item.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, properties, destination, status, source);
    }
}

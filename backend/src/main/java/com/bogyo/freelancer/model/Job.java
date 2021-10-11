package com.bogyo.freelancer.model;


import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import javax.persistence.*;

@Entity
@Table(name = "job")
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_id")
    private long id;

    @ManyToOne
    @JoinColumn(name = "fk_item", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Item item;

    @OneToOne
    @JoinColumn(name = "fk_user", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User freelancer;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public User getFreelancer() {
        return freelancer;
    }

    public void setFreelancer(User freelancer) {
        this.freelancer = freelancer;
    }
}

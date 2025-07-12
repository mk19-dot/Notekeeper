package com.entities;


import javax.persistence.*;
import java.util.Date;
import java.util.Random;

@Entity
@Table(name = "notes")
public class Note {
    @Id
    private int noteID;
    private String title;
    @Column(length = 1500)
    private String content;
    private Date addedDate;

    public Note() {
        super();
    }

    public Note(String title, String content, Date addedDate) {
        this.noteID = new Random().nextInt(1000);
        this.title = title;
        this.content = content;
        this.addedDate = addedDate;
    }

    public int getNoteID() {
        return noteID;
    }

    public void setNoteID(int noteID) {
        this.noteID = noteID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }
}

package com.zte.level_46.entity;


import java.io.Serializable;
import java.util.Date;

public class Score implements Serializable {

  private Integer id;
  private String ke;
  private Integer allScores;
  private Integer hearing;
  private Integer reading;
  private Integer writing;
  private Date gmtCreate;
  private Date gmtModified;

    public Score() {
    }

    public Score(Integer id, String ke, Integer allScores, Integer hearing, Integer reading, Integer writing, Date gmtCreate, Date gmtModified) {
        this.id = id;
        this.ke = ke;
        this.allScores = allScores;
        this.hearing = hearing;
        this.reading = reading;
        this.writing = writing;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKe() {
        return ke;
    }

    public void setKe(String ke) {
        this.ke = ke;
    }

    public Integer getAllScores() {
        return allScores;
    }

    public void setAllScores(Integer allScores) {
        this.allScores = allScores;
    }

    public Integer getHearing() {
        return hearing;
    }

    public void setHearing(Integer hearing) {
        this.hearing = hearing;
    }

    public Integer getReading() {
        return reading;
    }

    public void setReading(Integer reading) {
        this.reading = reading;
    }

    public Integer getWriting() {
        return writing;
    }

    public void setWriting(Integer writing) {
        this.writing = writing;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", ke='" + ke + '\'' +
                ", allScores=" + allScores +
                ", hearing=" + hearing +
                ", reading=" + reading +
                ", writing=" + writing +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}

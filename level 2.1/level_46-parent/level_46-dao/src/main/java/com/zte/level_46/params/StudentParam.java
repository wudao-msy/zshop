package com.zte.level_46.params;

/**
 * Author:msy
 * Date:2020-06-27 21:38
 * Description:<描述>
 */
public class StudentParam {

    private String name;
    private String cert;
    private String ke;
    private Integer sex;
    private String play;
    private Integer minScore;
    private Integer maxScore;
    private Integer isValid;

    public StudentParam() {
    }

    public StudentParam(String name, String cert, String ke, Integer sex, String play, Integer minScore, Integer maxScore, Integer isValid) {
        this.name = name;
        this.cert = cert;
        this.ke = ke;
        this.sex = sex;
        this.play = play;
        this.minScore = minScore;
        this.maxScore = maxScore;
        this.isValid = isValid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCert() {
        return cert;
    }

    public void setCert(String cert) {
        this.cert = cert;
    }

    public String getKe() {
        return ke;
    }

    public void setKe(String ke) {
        this.ke = ke;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPlay() {
        return play;
    }

    public void setPlay(String play) {
        this.play = play;
    }

    public Integer getMinScore() {
        return minScore;
    }

    public void setMinScore(Integer minScore) {
        this.minScore = minScore;
    }

    public Integer getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(Integer maxScore) {
        this.maxScore = maxScore;
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    @Override
    public String toString() {
        return "StudentParam{" +
                "name='" + name + '\'' +
                ", cert='" + cert + '\'' +
                ", ke='" + ke + '\'' +
                ", sex=" + sex +
                ", play='" + play + '\'' +
                ", minScore=" + minScore +
                ", maxScore=" + maxScore +
                ", isValid=" + isValid +
                '}';
    }
}

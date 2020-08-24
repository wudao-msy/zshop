package com.zte.level_46.params;

/**
 * Author:msy
 * Date:2020-06-30 10:45
 * Description:<描述>
 */
public class ExamParam {
    private Integer examId;
    private String play;
    private Integer kind;
    private Integer isValid;

    public ExamParam() {
    }

    public ExamParam(Integer examId,String play, Integer kind, Integer isValid) {
        this.examId=examId;
        this.play = play;
        this.kind = kind;
        this.isValid = isValid;
    }

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public String getPlay() {
        return play;
    }

    public void setPlay(String play) {
        this.play = play;
    }

    public Integer getKind() {
        return kind;
    }

    public void setKind(Integer kind) {
        this.kind = kind;
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    @Override
    public String toString() {
        return "ExamParam{" +
                "play='" + play + '\'' +
                ", kind=" + kind +
                ", isValid=" + isValid +
                '}';
    }
}

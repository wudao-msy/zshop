package com.zte.level_46.dao;

import com.zte.level_46.entity.Exam;
import com.zte.level_46.params.ExamParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-27 19:00
 * Description:<描述>
 */
@Repository
public interface ExamDAO {

    public List<Exam> selectAll();

    public void insert(Exam exam);

    public Exam selectByName(String name);

    public void update(Exam exam);

    public Exam selectById(Integer id);

    public void updateStatus(@Param("id") Integer id, @Param("isValid") Integer isVaild);

    public List<Exam> selectByParams(ExamParam examParam);

    public List<Exam> selectEnable(Integer isValid);

}

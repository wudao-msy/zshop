package com.zte.level_46.service;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.entity.Exam;
import com.zte.level_46.exception.ExamNameExistException;
import com.zte.level_46.params.ExamParam;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-29 0:10
 * Description:<描述>
 */

public interface ExamService {

    public PageInfo<Exam> findAll(Integer page, Integer rows);

    public void add(Exam exam) throws ExamNameExistException;

    public boolean checkName(String name);

    public void modify(Exam exam) throws ExamNameExistException;

    public Exam findById(Integer id);

    public void modifyStatus(Integer id, Integer isValid);

    public List<Exam> findByParams(ExamParam examParam);

    public List<Exam> findEnable(Integer isValid);


}

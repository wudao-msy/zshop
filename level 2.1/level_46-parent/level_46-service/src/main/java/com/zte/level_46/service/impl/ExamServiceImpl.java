package com.zte.level_46.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.dao.ExamDAO;
import com.zte.level_46.entity.Exam;
import com.zte.level_46.exception.ExamNameExistException;
import com.zte.level_46.params.ExamParam;
import com.zte.level_46.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-30 10:45
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class ExamServiceImpl implements ExamService {

    @Autowired
    private ExamDAO examDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<Exam> findAll(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<Exam> exams = examDAO.selectAll();
        PageInfo<Exam> pageInfo = new PageInfo<>(exams);
        return pageInfo;
    }

    @Override
    public void add(Exam exam) throws ExamNameExistException {
        Exam c=examDAO.selectByName(exam.getName());
        if(c!=null){
            throw new ExamNameExistException("用户名已经存在");
        }
        examDAO.insert(exam);
    }

    @Override
    public boolean checkName(String name){
        Exam exam=examDAO.selectByName(name);
        if(exam!=null){
            return false;
        }
        return true;
    }

    @Override
    public void modify(Exam exam) throws ExamNameExistException {
        Exam c=examDAO.selectByName(exam.getName());
        if(c!=null&&!(c.getName().equals(exam.getName()))){
            throw new ExamNameExistException("用户名已经存在");
        }
        examDAO.update(exam);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Exam findById(Integer id) {
        return examDAO.selectById(id);
    }

    @Override
    public void modifyStatus(Integer id, Integer isValid) {
        examDAO.updateStatus(id,isValid);

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Exam> findByParams(ExamParam examParam) {

        return examDAO.selectByParams(examParam);
    }

    @Override
    public List<Exam> findEnable(Integer isValid) {
        return examDAO.selectEnable(isValid);
    }

}

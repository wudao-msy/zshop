package com.zte.level_46.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.constants.Constant;
import com.zte.level_46.dao.StudentDAO;
import com.zte.level_46.entity.Student;
import com.zte.level_46.exception.LoginErrorException;
import com.zte.level_46.exception.StudentNameExistException;
import com.zte.level_46.params.StudentParam;
import com.zte.level_46.service.StudentService;
import com.zte.level_46.vo.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-29 0:10
 * Description:<描述>
 */ 
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDAO studentDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<Student> findAll_4(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<Student> students = studentDAO.selectAll_4();
        PageInfo<Student> pageInfo = new PageInfo<>(students);
        return pageInfo;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<Student> findAll_6(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<Student> students = studentDAO.selectAll_6();
        PageInfo<Student> pageInfo = new PageInfo<>(students);
        return pageInfo;
    }

    @Override
    public void add(Student student) throws StudentNameExistException {
        Student s=studentDAO.selectByName(student.getName());
        if(s!=null){
            throw new StudentNameExistException("学生名已经存在");
        }
        studentDAO.insert(student);
    }

    @Override
    public boolean checkName(String name){
        Student student=studentDAO.selectByName(name);
        if(student!=null){
            return false;
        }
        return true;
    }

    @Override
    public void modify(Student student) throws StudentNameExistException {
        Student s=studentDAO.selectByName(student.getName());
        if(s!=null&&!(s.getName().equals(student.getName()))){
            throw new StudentNameExistException("学生名已经存在");
        }
        studentDAO.update(student);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Student findById(Integer id) {
        return studentDAO.selectById(id);
    }

    @Override
    public void modifyStatus(Integer id, Integer isValid) {
        studentDAO.updateStatus(id,isValid);

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Student> findByParams_4(StudentParam studentParam) {

        return studentDAO.selectByParams_4(studentParam);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Student> findByParams_6(StudentParam studentParam) {

        return studentDAO.selectByParams_6(studentParam);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Student login(String email, String password) throws LoginErrorException {

        Student student=studentDAO.selectByLoginNameAndPass(email,password, Constant.SYSUSER_VALID);
        if(student==null){
            throw  new LoginErrorException("登录失败，用户名或者密码不正确");
        }

        return student;
    }

    @Override
    public void addStudent(StudentVO studentVO) {
        studentDAO.insertStudent(studentVO);
    }

    @Override
    public void modifyDetail(StudentVO studentVO) {
        studentDAO.updateDetail(studentVO);
    }

    @Override
    public void modifyPassword(String email, String password) {
        studentDAO.updatePassword(email,password);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Student findScore(String ke, String name, Integer eid) {
        return studentDAO.selectScore(ke,name,eid);
    }


}

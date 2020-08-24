package com.zte.level_46.service;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.entity.Student;
import com.zte.level_46.exception.LoginErrorException;
import com.zte.level_46.exception.StudentNameExistException;
import com.zte.level_46.params.StudentParam;
import com.zte.level_46.vo.StudentVO;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-29 0:10
 * Description:<描述>
 */

public interface StudentService {
    public PageInfo<Student> findAll_4(Integer page, Integer rows);

    public PageInfo<Student> findAll_6(Integer page, Integer rows);

    public void add(Student student) throws StudentNameExistException;

    public boolean checkName(String name);

    public void modify(Student student) throws StudentNameExistException;

    public Student findById(Integer id);

    public void modifyStatus(Integer id, Integer isValid);

    public List<Student> findByParams_4(StudentParam studentParam);

    public List<Student> findByParams_6(StudentParam studentParam);

    public Student login(String email, String password)throws LoginErrorException;

    public void addStudent(StudentVO studentVO);

    public void modifyDetail(StudentVO studentVO);

    public void modifyPassword(String email, String password);

    public Student findScore(String ke,String name,Integer eid);

}

package com.zte.level_46.dao;

import com.zte.level_46.entity.Student;
import com.zte.level_46.params.StudentParam;
import com.zte.level_46.vo.StudentVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-27 19:00
 * Description:<描述>
 */
@Repository
public interface StudentDAO {

    public List<Student> selectAll_4();

    public List<Student> selectAll_6();

    public void insert(Student student);

    public Student selectByName(String name);

    public void update(Student student);

    public Student selectById(Integer id);

    public void updateStatus(@Param("id") Integer id, @Param("isValid") Integer isVaild);

    public List<Student> selectByParams_4(StudentParam studentParam);

    public List<Student> selectByParams_6(StudentParam studentParam);

    public Student selectByLoginNameAndPass(@Param("email")String email, @Param("password")String password, @Param("isValid")Integer isValid);

    public void insertStudent(StudentVO studentVO);

    public void updateDetail(StudentVO studentVO);

    public void updatePassword(@Param("email")String email, @Param("password")String password);

    public Student selectScore(@Param("ke") String ke,@Param("name") String name,@Param("eid") Integer eid);
}

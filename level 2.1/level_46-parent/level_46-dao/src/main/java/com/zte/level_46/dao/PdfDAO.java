package com.zte.level_46.dao;

import com.zte.level_46.entity.Pdf;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-07-29 17:15
 * Description:<描述>
 */
@Repository
public interface PdfDAO {

    public List<Pdf> selectAll();

    public void insert(Pdf pdf);

    public Pdf selectByName(String Name);

    public void update(Pdf file);

    public Pdf selectById(Integer id);

    public void deteleById(Integer id);

    public List<Pdf> selectByStatus(Integer status);

}

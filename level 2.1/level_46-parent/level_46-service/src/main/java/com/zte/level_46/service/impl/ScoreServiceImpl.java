package com.zte.level_46.service.impl;

import com.zte.level_46.dao.ScoreDAO;
import com.zte.level_46.entity.Score;
import com.zte.level_46.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Author:msy
 * Date:2020-06-30 9:14
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class ScoreServiceImpl implements ScoreService {

    @Autowired
    private ScoreDAO scoreDAO;


    @Override
    public Integer add(Score score) {
        scoreDAO.insert(score);
        return  score.getId();
    }


}

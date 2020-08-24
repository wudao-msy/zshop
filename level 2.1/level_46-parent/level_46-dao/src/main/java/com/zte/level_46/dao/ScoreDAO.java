package com.zte.level_46.dao;

import com.zte.level_46.entity.Score;
import org.springframework.stereotype.Repository;

/**
 * Author:msy
 * Date:2020-06-30 9:05
 * Description:<描述>
 */
@Repository
public interface ScoreDAO {

    public void insert(Score score);

}

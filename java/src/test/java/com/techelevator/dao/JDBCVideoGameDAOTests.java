package com.techelevator.dao;

import com.techelevator.model.VideoGame;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class JDBCVideoGameDAOTests extends BaseDaoTests {

    private JDBCVideoGameDAO jdbcVideoGameDAO;

    @Before
    public void setup(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcVideoGameDAO = new JDBCVideoGameDAO(jdbcTemplate);
    }

    @Test
    public void returnsListOfVideoGames(){
        List<VideoGame> videoGames = jdbcVideoGameDAO.getVideoGameList();

        Assert.assertEquals(4, videoGames.size());
    }

}

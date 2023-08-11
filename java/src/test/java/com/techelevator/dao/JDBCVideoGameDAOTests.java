package com.techelevator.dao;

import com.techelevator.model.VideoGame;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.math.BigDecimal;
import java.time.LocalDate;
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

    @Test
    public void returnsCorrectVideoGame(){
        VideoGame videoGame = jdbcVideoGameDAO.getVideoGameById(1);
        BigDecimal releasePrice = new BigDecimal(60.00);
        LocalDate releaseDate = LocalDate.of(2023, 8, 6);
        VideoGame testGame = new VideoGame(1, "Halo", releaseDate, releasePrice, "This is Halo. It is a game.", "Bungie", "", "");
        Assert.assertEquals(testGame.getId(), videoGame.getId());
        Assert.assertEquals(testGame.getTitle(), videoGame.getTitle());
        Assert.assertEquals(testGame.getReleaseDate(), videoGame.getReleaseDate());
        Assert.assertTrue(testGame.getReleasePrice().compareTo(videoGame.getReleasePrice()) == 0);
        Assert.assertEquals(testGame.getDescription(), videoGame.getDescription());
        Assert.assertEquals(testGame.getPublisherName(), videoGame.getPublisherName());
    }

}

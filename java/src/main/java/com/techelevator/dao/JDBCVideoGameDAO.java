package com.techelevator.dao;

import com.techelevator.model.VideoGame;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCVideoGameDAO implements VideoGameDAO{

    private JdbcTemplate jdbcTemplate;

    public JDBCVideoGameDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<VideoGame> getVideoGameList() {
        List<VideoGame> videoGames = new ArrayList<>();

        String sql = "SELECT id, title, release_date, release_price, description, company_name FROM video_game " +
                    "JOIN company ON publisher_id = company_id;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()){

            videoGames.add(mapRowToVideoGame(results));

        }
        return videoGames;
    }

    private VideoGame mapRowToVideoGame(SqlRowSet sqlRowSet){
        VideoGame videoGame = new VideoGame();

        videoGame.setId(sqlRowSet.getInt("id"));
        videoGame.setTitle(sqlRowSet.getString("title"));
        videoGame.setReleaseDate(sqlRowSet.getDate("release_date").toLocalDate());
        videoGame.setReleasePrice(sqlRowSet.getBigDecimal("release_price"));
        videoGame.setDescription(sqlRowSet.getString("description"));
        videoGame.setPublisherName(sqlRowSet.getString("company_name"));

        return videoGame;
    }

}

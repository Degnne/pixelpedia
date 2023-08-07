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

    @Override
    public VideoGame getVideoGameById(int id) {
        String sql = "SELECT id, title, release_date, release_price, description, company_name FROM video_game " +
                "JOIN company ON publisher_id = company_id WHERE id=? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        VideoGame videoGame = new VideoGame();
       if (results.next()) {
           videoGame = mapRowToVideoGame(results);

       }
       videoGame.setGenres(getGenresForVideoGames(id));
       videoGame.setStudios(getStudiosForVideoGames(id));
       videoGame.setSystems(getSystemForVideoGames(id));


        return videoGame;
    }


    private String[] getGenresForVideoGames(int id) {
        List<String> genres = new ArrayList<>();

        String sql = "SELECT genre_name from genre " +
                    "JOIN vg_genre ON genre.genre_id = vg_genre.genre_id " +
                    "WHERE vg_genre.vg_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        while(results.next()){
            genres.add(results.getString("genre_name"));
        }

        return genres.toArray(new String[genres.size()]);
    }

    private String[] getStudiosForVideoGames(int id){
        List<String> studios = new ArrayList<>();

        String sql = "SELECT company_name FROM company JOIN vg_studio ON company.company_id = vg_studio.studio_id WHERE vg_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while(results.next()){
            studios.add(results.getString("company_name"));
        }

        return studios.toArray(new String[studios.size()]);
    }

    private String[] getSystemForVideoGames(int id){
        List<String> systems = new ArrayList<>();

        String sql = "SELECT system_name FROM system JOIN vg_system ON vg_system.system_id = system.system_id WHERE vg_system.vg_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        while(results.next()){
            systems.add(results.getString("system_name"));
        }

        return systems.toArray(new String[systems.size()]);
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

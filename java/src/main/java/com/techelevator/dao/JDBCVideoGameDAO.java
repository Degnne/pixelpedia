package com.techelevator.dao;

import com.techelevator.model.VideoGame;
import org.springframework.dao.DataIntegrityViolationException;
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

        String sql = "SELECT id, title, release_date, release_price, description, company_name, box_art, rating FROM video_game " +
                    "JOIN company ON publisher_id = company_id;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()){

            videoGames.add(mapRowToVideoGame(results));

        }
        return videoGames;
    }

    @Override
    public VideoGame getVideoGameById(int id) {
        String sql = "SELECT id, title, release_date, release_price, description, company_name, box_art, rating FROM video_game " +
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

    @Override
    public VideoGame addVideoGame(VideoGame videoGame) {
        String sql = "INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) " +
                    "VALUES (?,?, ?, ?, SELECT publisher_id FROM video_game JOIN company ON video_game.publisher_id = company.company_id WHERE company_name = ? GROUP BY publisher_id;, ?, ?) " +
                    "RETURNING id;";

        int newVideoGameId = jdbcTemplate.queryForObject(sql, int.class, videoGame.getTitle(), videoGame.getReleaseDate(),
                        videoGame.getReleasePrice(), videoGame.getDescription(), videoGame.getPublisherName(), videoGame.getRating(), videoGame.getBoxArt());

        videoGame.setId(newVideoGameId);

        String[] genres = videoGame.getGenres();
        String[] studios = videoGame.getStudios();
        String[] systems = videoGame.getSystems();

        //Loop through array add each item into DB
        for(int i = 0; i < genres.length; i++){
            //TODO convert id, inserting into DB based off ID
            String genre = genres[i];
            int genreID = convertGenreNameToID(genre);
            //call a method that inserts into DB
            addGenreToVideoGame(newVideoGameId, genreID);
        }

        //Same for studios
        for(int i = 0; i < studios.length; i++){
            String studio = studios[i];
            int studioID = convertStudioNameToID(studio);
            addStudioToVideoGame(newVideoGameId, studioID);
        }

        //Same for systems
        for(int i = 0; i < systems.length; i++){
            String system = systems[i];
            int systemID = convertSystemNameToID(system);
            addSystemToVideoGame(newVideoGameId, systemID);
        }


        return videoGame;
    }

    @Override
    public void deleteVideoGame(int videoGameId) {

        String sql = "DELETE FROM vg_system WHERE vg_id = ?;";
        String sql2 = "DELETE FROM vg_studio WHERE vg_id = ?;";
        String sql3 = "DELETE FROM vg_genre WHERE vg_id = ?;";
        String sql4 = "DELETE FROM video_game WHERE id = ?;";

        try{
            jdbcTemplate.update(sql, videoGameId);
            jdbcTemplate.update(sql2, videoGameId);
            jdbcTemplate.update(sql3, videoGameId);
            jdbcTemplate.update(sql4, videoGameId);
        }
        catch(DataIntegrityViolationException e){

          throw new DataIntegrityViolationException("Invalid Video Game ID", e);

        }

    }

    @Override
    public String[] genreArray() {
        List<String> genres = new ArrayList<>();

        String sql = "SELECT genre_name FROM genre;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()){
            genres.add(results.getString("genre_name"));
        }
        return genres.toArray(new String[genres.size()]);
    }

    @Override
    public String[] systemArray() {
        List<String> systems = new ArrayList<>();
        String sql = "SELECT system_name FROM system;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()){
            systems.add(results.getString("system_name"));
        }
        return systems.toArray(new String[systems.size()]);
    }

    @Override
    public String[] companyArray() {
        List<String> companies = new ArrayList<>();
        String sql = "SELECT company_name FROM company;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()){
            companies.add(results.getString("company_name"));
        }
        return companies.toArray(new String[companies.size()]);
    }

    @Override
    public VideoGame updateVideoGame(VideoGame videoGame) {
//        String sql = "UPDATE video_game\n" +
//                "SET title = 'Team Foxtrot', release_date = current_date, release_price = 150, description = 'Favorite Game', publisher_id = 1, rating = 'M', box_art = 'url'\n" +
//                "WHERE id = 3;  "
        return null;
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




    private int convertGenreNameToID(String genre){
        int id = 0;
        String sql = "SELECT genre_id FROM genre WHERE genre_name = ?;";


       SqlRowSet results = jdbcTemplate.queryForRowSet(sql, genre);

        if(results.next()){
            id = results.getInt("genre_id");
        }
        return id;
    }

    private void addGenreToVideoGame(int vgID, int genreID ){
        String sql = "INSERT INTO vg_genre VALUES (?, ?);";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, vgID, genreID);

    }

    private int convertStudioNameToID(String studio){
        int id = 0;
        String sql = "SELECT studio_id FROM vg_studio JOIN company ON vg_studio.studio_id = company.company_id WHERE company_name = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, studio);

        if(results.next()){
            id = results.getInt("studio_id");
        }


        return id;
    }

    private void addStudioToVideoGame(int vgID, int studioID){
        String sql = "INSERT INTO vg_studio VALUES (?, ?);";

        jdbcTemplate.queryForRowSet(sql, vgID, studioID);

    }

    private int convertSystemNameToID(String system){
        int id = 0;
        String sql = "SELECT system_id FROM system JOIN company ON system.manufacturer_id = company.company_id WHERE system_name = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, system);

        if(results.next()){
            id = results.getInt("system_id");
        }

        return id;
    }

    private void addSystemToVideoGame(int vgID, int systemID){
        String sql = "INSERT INTO vg_system VALUES (?, ?);";

        jdbcTemplate.queryForRowSet(sql, vgID, systemID);
    }




    private VideoGame mapRowToVideoGame(SqlRowSet sqlRowSet){
        VideoGame videoGame = new VideoGame();

        videoGame.setId(sqlRowSet.getInt("id"));
        videoGame.setTitle(sqlRowSet.getString("title"));
        videoGame.setReleaseDate(sqlRowSet.getDate("release_date").toLocalDate());
        videoGame.setReleasePrice(sqlRowSet.getBigDecimal("release_price"));
        videoGame.setDescription(sqlRowSet.getString("description"));
        videoGame.setPublisherName(sqlRowSet.getString("company_name"));
        videoGame.setRating(sqlRowSet.getString("rating"));
        videoGame.setBoxArt(sqlRowSet.getString("box_art"));

        return videoGame;
    }

}

package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.techelevator.model.VideoGame;
import com.techelevator.model.VideoGameList;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.techelevator.model.User;

@Component
public class JdbcUserDao implements UserDao {

    private final JdbcTemplate jdbcTemplate;
    private final VideoGameDAO videoGameDAO;

    public JdbcUserDao(JdbcTemplate jdbcTemplate, VideoGameDAO videoGameDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.videoGameDAO = videoGameDAO;
    }

    @Override
    public int findIdByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        int userId;
        try {
            userId = jdbcTemplate.queryForObject("select user_id from users where username = ?", int.class, username);
        } catch (EmptyResultDataAccessException e) {
            throw new UsernameNotFoundException("User " + username + " was not found.");
        }

        return userId;
    }

	@Override
	public User getUserById(int userId) {
		String sql = "SELECT * FROM users WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
		if (results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "select * from users";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            User user = mapRowToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public User findByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        for (User user : this.findAll()) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        throw new UsernameNotFoundException("User " + username + " was not found.");
    }

    @Override
    public boolean create(String username, String password, String role) {
        String insertUserSql = "insert into users (username,password_hash,role) values (?,?,?)";
        String password_hash = new BCryptPasswordEncoder().encode(password);
        String ssRole = role.toUpperCase().startsWith("ROLE_") ? role.toUpperCase() : "ROLE_" + role.toUpperCase();

        return jdbcTemplate.update(insertUserSql, username, password_hash, ssRole) == 1;
    }

    @Override
    public VideoGameList[] getVideoGameListByUserId(int vgid) {
        //String sql for the video game list for each list type
        //That returns multiple lines Loop through each
        List<Integer> playedList = getVideoGamesByListNameAndId("Played", vgid);
        List<Integer> currentlyList = getVideoGamesByListNameAndId("Currently", vgid);
        List<Integer> wishlistList = getVideoGamesByListNameAndId("Wishlist", vgid);
        List<Integer> customList = getVideoGamesByListNameAndId("Custom", vgid);
        List<VideoGame> videoGameLists = new ArrayList<>();

        VideoGameList[] gameLists = new VideoGameList[4];
        gameLists[0].setListName("Played");
        List<VideoGame> thisList = new ArrayList<VideoGame>();
        for(Integer id : playedList){

            thisList.add(videoGameDAO.getVideoGameById(id));


        }
        gameLists[0].setVideoGameArray(thisList.toArray(new VideoGame[0]));
        for(Integer id : currentlyList){
            videoGameLists.add(videoGameDAO.getVideoGameById(id));
        }
        for(Integer id : wishlistList){
            videoGameLists.add(videoGameDAO.getVideoGameById(id));
        }
        for(Integer id : customList){
            videoGameLists.add(videoGameDAO.getVideoGameById(id));
        }


        //return videoGameLists.toArray(new [videoGameLists.size()]);
       return gameLists;
    }


    private List<Integer> getVideoGamesByListNameAndId(String listName, int id){
        List<Integer> idList = new ArrayList<>();
        String sql = "SELECT vg_id FROM vg_list WHERE list_name = ? AND user_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, listName, id);

        if(results.next()){
            idList.add(results.getInt("vg_id"));
        }
        return idList;
    }

    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setAuthorities(Objects.requireNonNull(rs.getString("role")));
        user.setSteamId(rs.getInt("steam_user_id"));
        user.setBio(rs.getString("bio"));
        user.setEmail(rs.getString("email"));
        user.setTagline(rs.getString("tagline"));
        user.setAvatarURL(rs.getString("avatar_pic"));
        user.setActivated(true);
        return user;
    }
}




package com.techelevator.dao;

import com.techelevator.model.Rating;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCRatingDAO implements RatingDAO {


    private JdbcTemplate jdbcTemplate;

    public JDBCRatingDAO (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Rating addRating(Rating rating) {
        String sql = "INSERT INTO review_rating (user_id, game_id, review_id, overall_rating, story_rating, " +
                "visual_rating, audio_rating, gameplay_rating, difficulty_rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING rating_id;";

        int ratingId = jdbcTemplate.queryForObject(sql, int.class, rating.getUserId(), rating.getGameId(), rating.getReviewId(), rating.getOverallRating(), rating.getStoryRating(),
                rating.getVisualRating(), rating.getAudioRating(), rating.getGameplayRating(), rating.getDifficultyRating() );

        if(ratingId > 0){
            rating = getRatingByRatingId(ratingId);
        }

        return rating;
    }

    @Override
    public Rating editRating(Rating rating, int ratingId) {
        String sql = "UPDATE review_rating SET overall_rating = ?, story_rating = ?, visual_rating = ?, audio_rating = ?, " +
                "gameplay_rating = ?, difficulty_rating = ? WHERE rating_id = ?;";

        jdbcTemplate.update(sql, rating.getOverallRating(), rating.getStoryRating(), rating.getVisualRating(),
                rating.getAudioRating(), rating.getGameplayRating(), rating.getDifficultyRating() ,ratingId);

        return getRatingByRatingId(ratingId);
    }


    public Rating getRatingByRatingId(int id){
        String sql = "SELECT rating_id, user_id, game_id, review_id, overall_rating, story_rating, visual_rating, audio_rating, " +
                "gameplay_rating, difficulty_rating FROM review_rating WHERE  rating_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        if(results.next()){
            return mapRowToRating(results);
        }

        return null;
    }

    private Rating mapRowToRating(SqlRowSet sqlRowSet){
        Rating rating = new Rating();
        rating.setRatingId(sqlRowSet.getInt("rating_id"));
        rating.setUserId(sqlRowSet.getInt("user_id"));
        rating.setGameId(sqlRowSet.getInt("game_id"));
        rating.setReviewId(sqlRowSet.getInt("review_id"));
        rating.setOverallRating(sqlRowSet.getInt("overall_rating"));
        rating.setStoryRating(sqlRowSet.getInt("story_rating"));
        rating.setVisualRating(sqlRowSet.getInt("visual_rating"));
        rating.setAudioRating(sqlRowSet.getInt("audio_rating"));
        rating.setGameplayRating(sqlRowSet.getInt("gameplay_rating"));
        rating.setDifficultyRating(sqlRowSet.getInt("difficulty_rating"));
        return rating;
    }
}

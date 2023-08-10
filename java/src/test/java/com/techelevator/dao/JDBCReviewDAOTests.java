package com.techelevator.dao;

import com.techelevator.model.Comment;
import com.techelevator.model.Review;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.boot.devtools.autoconfigure.LocalDevToolsAutoConfiguration;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.LocalDate;

public class JDBCReviewDAOTests extends BaseDaoTests {

    private static final Comment COMMENT_1 = new Comment(1,1,1,"Test Comment", LocalDate.parse("2023-01-01"));
    private static final Comment COMMENT_2 = new Comment(2,2,1, "Test Comment", LocalDate.now());
    private static final Comment COMMENT_3 = new Comment(1,3,1,"Test Comment", LocalDate.parse("2023-01-01"));

    private static final Comment[] comments = new Comment[]{COMMENT_1, COMMENT_2, COMMENT_3 };

    private static final Review REVIEW_1 = new Review(1, 1, 1, "Test", "Test Tile", comments ,LocalDate.parse("2021-01-01"));
    private JDBCReviewDAO jdbcReviewDAO;

    @Before
    public void setup(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcReviewDAO = new JDBCReviewDAO(jdbcTemplate);
    }


    @Test
    public void add_review_test(){
        Review newReview = jdbcReviewDAO.addReview(REVIEW_1);

        int newID = newReview.getReviewId();
        Assert.assertTrue(newID >0);

       Review actual = jdbcReviewDAO.getReviewByReviewId(newID);
       assertReviewMatch(newReview, actual);

    }

    @Test
    public void edit_review_test(){
        Review review1 = jdbcReviewDAO.getReviewByReviewId(1);
        review1.setReviewTitle("HEY JAVA BLUE!");
        review1.setReviewText("HEY JAVA GREEN!");
        jdbcReviewDAO.editReview(review1);


        Review review2 = jdbcReviewDAO.getReviewByReviewId(1);


        assertReviewMatch(review1, review2);
    }



    private void assertReviewMatch(Review expected, Review actual){
        Assert.assertEquals(expected.getReviewId(), actual.getReviewId());
        Assert.assertEquals(expected.getGameId(), actual.getGameId());
        Assert.assertEquals(expected.getReviewText(), actual.getReviewText());
        Assert.assertEquals(expected.getDate(), actual.getDate());
        Assert.assertEquals(expected.getReviewTitle(), actual.getReviewTitle());

        
        int expectedCommentsLength = expected.getComments().length;
        int actualCommentsLength = actual.getComments().length;
        Assert.assertEquals(expectedCommentsLength, actualCommentsLength);
    }
}

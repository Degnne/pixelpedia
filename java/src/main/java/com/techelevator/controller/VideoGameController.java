package com.techelevator.controller;

import com.techelevator.dao.JDBCVideoGameDAO;
import com.techelevator.dao.VideoGameDAO;
import com.techelevator.model.VideoGame;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping (path="/videogames")
public class VideoGameController {


    private VideoGameDAO videoGameDAO;

    VideoGameController(VideoGameDAO videoGameDAO) {
        this.videoGameDAO = videoGameDAO;
    }


    @RequestMapping (path = "", method = RequestMethod.GET)
    public List<VideoGame> listOfVideoGames(){
        return videoGameDAO.getVideoGameList();
    }
}

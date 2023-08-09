package com.techelevator.controller;

import com.techelevator.dao.JDBCVideoGameDAO;
import com.techelevator.dao.VideoGameDAO;
import com.techelevator.model.VideoGame;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping (path = "{id}", method = RequestMethod.GET)
    public VideoGame getVideoGameById(@PathVariable int id) {
        return videoGameDAO.getVideoGameById(id);

    }
    @RequestMapping (path = "", method = RequestMethod.POST)
    public VideoGame addVideoGame(@RequestBody VideoGame videoGame){
        return videoGameDAO.addVideoGame(videoGame);
    }
    @RequestMapping (path = "{videoGameId}", method = RequestMethod.DELETE)
    public void deleteVideoGame(@PathVariable int videoGameId){
     videoGameDAO.deleteVideoGame(videoGameId);
    }

    @RequestMapping (path = "", method=RequestMethod.PUT)
    public VideoGame updateVideogame (@RequestBody VideoGame videogame){
        return videoGameDAO.updateVideoGame(videogame);
    }

    @RequestMapping (path = "/genres", method = RequestMethod.GET )
    public String[] getArrayOfGenres(){
        return videoGameDAO.genreArray();
    }

    @RequestMapping (path = "/systems", method = RequestMethod.GET )
    public String[] getArrayOfSystems(){
        return videoGameDAO.systemArray();
    }

    @RequestMapping (path = "/companies", method = RequestMethod.GET )
    public String[] getArrayOfCompanies(){
        return videoGameDAO.companyArray();
    }

}

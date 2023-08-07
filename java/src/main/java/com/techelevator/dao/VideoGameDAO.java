package com.techelevator.dao;

import com.techelevator.model.VideoGame;

import java.util.List;

public interface VideoGameDAO {

    List<VideoGame> getVideoGameList();
    VideoGame getVideoGameById(int Id);
    VideoGame addVideoGame(VideoGame videoGame);




}

package com.techelevator.controller;

import com.techelevator.dao.UserDao;
import com.techelevator.model.User;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping (path = "/users")
public class UserController {

    private UserDao userDao;

    UserController(UserDao userDao){
        this.userDao = userDao;
    }

    @RequestMapping (path = "/{id}", method =  RequestMethod.GET)
    public User getUsernameById(int id){
        return userDao.getUserById(id);
    }


}

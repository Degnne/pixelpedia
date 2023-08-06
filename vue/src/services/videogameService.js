import axios from "axios";

export default{

    getVideoGames(){
        return axios.get('/videogames');
    }
    
}
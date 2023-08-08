import axios from "axios";

export default{

    getVideoGames(){
        return axios.get('/videogames');
    },
    
    getVideoGameById(id){
        return axios.get('/videogames/' + id);
    },

    addVideoGame(videogame) {
        return axios.post('/videogames', videogame);
    },

    getGenres() {
        return axios.get('/videogames/genres');
    },

    getCompanies() {
        return axios.get('/videogames/companies');
    },

    getSystems() {
        return axios.get('./videogames/systems');
    }
}
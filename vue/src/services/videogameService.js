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
    },

    deleteGame(gameId) {
        return axios.delete(`/videogames/${gameId}`)
    },

    updateGame(videogame) {
        return axios.put('/videogames', videogame)
    },

    addGameReview(review) {
        return axios.post('/videogames/reviews', review)
    },

    editGameReview(review) {
        return axios.put(`/videogames/reviews/${review.id}`, review)
    },

    getReviewsByGameId(gameId) {
        return axios.get(`/videogames/${gameId}/reviews`)
    }
}
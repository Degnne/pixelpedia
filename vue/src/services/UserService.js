import axios from "axios";

export default{

    getUserById(userId) {
        return axios.get(`/users/${userId}`);
    },

    editProfile(user) {
        return user;
    },

    getListsForUser(userId) {
        return axios.get(`/users/${userId}/lists`);
    }

}
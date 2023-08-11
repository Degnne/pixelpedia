import axios from "axios";

export default{

    getUserById(userId) {
        return axios.get(`/users/${userId}`);
    }

}
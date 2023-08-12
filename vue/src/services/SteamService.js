import axios from 'axios';

const steam = axios.create({
	// Configuration
	baseURL: 'http://api.steampowered.com',
	timeout: 8000
});

export default {

    getNews(steamAppId) {
        return steam.get(`/ISteamNews/GetNewsForApp/v0002/?appid=${steamAppId}&count=3&maxlength=300&format=json`);
    }

}
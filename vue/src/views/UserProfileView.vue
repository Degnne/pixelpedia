<template>
  <div>
      <button v-if="canEdit" @click.prevent="$router.push({name: 'editprofile'})">Edit Profile</button>
      <div id="userdetails" :style="{ 
        background: gradientBackground + '0% 0% / 200% 200% repeat',
        animation: 'Animation 20s ease infinite'
        }">
        <div>
            <div class= "title"><h2>{{user.username}}</h2></div>        
            
            <img :src="user.avatarURL" alt="" class="userimage">
            <div id="profile-tagline">{{user.tagline}}</div>
        </div>
        <div id="details"><div>{{user.bio}}</div></div>
      </div>
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'
import ColorThief from "colorthief";
export default {
    data() {
        return {
            user: {},
            palette: null
        }
    },
    computed: {
        canEdit() {
            return this.user.id === this.$store.state.user.id;
        },
        gradientBackground() {
            if (this.palette) {
                const gradientColors = this.palette
                .map(color => `rgb(${color[0]}, ${color[1]}, ${color[2]})`)
                .join(', ');

                return `linear-gradient(to right, ${gradientColors})`;
            }

            return 'none';
        },
    },
    mounted() {
        const userId = this.$route.params.id;
        UserService.getUserById(userId).then(response => {
            this.user = response.data;
            const colorThief = new ColorThief();
            const img = new Image();

            img.addEventListener('load', () => {
            this.palette = colorThief.getPalette(img);
            //console.log(this.palette);
            });

            let imageURL = this.user.avatarURL;
            let googleProxyURL = 'https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?container=focus&refresh=2592000&url=';

            img.crossOrigin = 'Anonymous';
            img.src = googleProxyURL + encodeURIComponent(imageURL);
        });
        
    }
}
</script>

<style>
#userdetails {
    width: 600px;
    border-radius: 20px;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, .3);
}
#userdetails h2 {
    margin-top: 0px;
}
#profile-tagline {
    border-radius: 10px;
    padding: 5px;
    background: linear-gradient(to right, rgba(30, 30, 30, .7), rgba(30, 30, 30, 0));
    margin: 5px;
}
.userimage {
    width: 200px;
}
</style>
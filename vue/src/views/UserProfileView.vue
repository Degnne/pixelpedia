<template>
  <div id="profilepage">
      <button v-if="canEdit" @click.prevent="$router.push({name: 'editprofile'})">Edit Profile</button>
      <div id="userdetails" :style="{ 
        background: gradientBackground + '0% 0% / 200% 200% repeat',
        animation: 'Animation 20s ease infinite'
        }">
        <div>
            <div class= "title"><h2>{{user.username}}</h2></div>        
            
            <img :src="user.avatarURL" alt="" class="userimage" @load="pixelateImage(this, 10)">
            <div id="profile-tagline">{{user.tagline}}</div>
        </div>
        <div id="details"><div>{{user.bio}}</div></div>
      </div>
      <div v-for="userList in userLists" :key="userList.listName">
          <h3>{{userList.listName}}</h3>
          <div v-if="dataLoaded" class="list-container">
            <div v-for="(game, index) in userList.videoGameArray" :key="userList.listName + '-' + index" class="videoGameCard">
                <router-link v-bind:to="{name: 'videogamedetails', params: {id: getGameId(game)}, hash: '#detailsPage'}">
                    <VideoGameCard :videogame="game"/>
                </router-link>
            </div>
        </div>
      </div>
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'
import ColorThief from "colorthief";
import VideoGameCard from '@/components/VideoGameCard.vue'
export default {
    components: {
        VideoGameCard
    },
    data() {
        return {
            user: {},
            palette: null,
            userLists: [],
            dataLoaded: false
        }
    },
    computed: {
        avatarImage() {
            const image = new Image();
            image.src = this.user.avatarURL;
            image.crossOrigin = "Anonymous";
            image.width = 100;
            image.height = 100;
            this.pixelateImage(image, 100);
            return image.src;
        },
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
    methods: {
        getGameId(videogame) {
            return videogame.id;
        },
        pixelateImage(originalImage, pixelationFactor) {
            const canvas = document.createElement("canvas");
            const context = canvas.getContext("2d");
            const originalWidth = originalImage.width;
            const originalHeight = originalImage.height;
            const canvasWidth = originalWidth;
            const canvasHeight = originalHeight;
            canvas.width = canvasWidth;
            canvas.height = canvasHeight;
            context.drawImage(originalImage, 0, 0, originalWidth, originalHeight);
            const originalImageData = context.getImageData(
                0,
                0,
                originalWidth,
                originalHeight
            ).data;
            if (pixelationFactor !== 0) {
                for (let y = 0; y < originalHeight; y += pixelationFactor) {
                for (let x = 0; x < originalWidth; x += pixelationFactor) {
                    // extracting the position of the sample pixel
                    const pixelIndexPosition = (x + y * originalWidth) * 4;
                    // drawing a square replacing the current pixels
                    context.fillStyle = `rgba(
                    ${originalImageData[pixelIndexPosition]},
                    ${originalImageData[pixelIndexPosition + 1]},
                    ${originalImageData[pixelIndexPosition + 2]},
                    ${originalImageData[pixelIndexPosition + 3]}
                    )`;
                    context.fillRect(x, y, pixelationFactor, pixelationFactor);
                }
                }
            }
            originalImage.src = canvas.toDataURL();
        }
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
        UserService.getListsForUser(userId).then(response => {
            this.userLists = response.data;
            this.dataLoaded = true;
        });
        
    }
}
</script>

<style>
#profilepage {
    display: flex;
    flex-direction: column;
}
#profilepage button {
    width: 100px;
    align-self: flex-end;
}
#userdetails {
    width: 600px;
    border-radius: 20px;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, .3);
    align-self: center;
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
.list-container {
    display: flex;
    flex-wrap: wrap;
}
</style>
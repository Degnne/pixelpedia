<template>
<div>
    <div v-bind:key="emulator.name" v-for="emulator in emulator" class="videoGameCard" @click="playSound(emulator.sound)"><router-link v-bind:to="emulator.routerLink"><img class="gbaGif" v-bind:src="emulator.gifImage" ><div><img class="gba" v-bind:src="emulator.imageUrl"></div></router-link></div>
</div>
</template>


<script>

export default{ 
    data(){
    return{
        emulator: [{
            name: 'GBA',
            routerLink: '/emulatorlist/gba',
            imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pngkey.com%2Fpng%2Ffull%2F142-1425125_the-gameboy-advance-launched-in-japan-15-years.png&f=1&nofb=1&ipt=ec4334e682c75bb49bf8314d412ecf828981193c407f9c979afd53b2e5af08b2&ipo=images',
            gifImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.tenor.com%2FeU6-5B11bd8AAAAC%2Ftextgif-nintendo.gif&f=1&nofb=1&ipt=a311b60dce40429bb7bf275080543ae7ff50a571a49dd21ed75acc7ee8500c0a&ipo=images',
            sound: '/audio/gba.mp3',
            audio: null,
        }]
      }
    },
    methods: {
    playSound (sound) {
      if(sound) {
        this.audio = new Audio(sound);
        this.audio.volume(0.1);
        this.audio.play(1);
      }
    }
    }
}

</script>

<style>
.gba{
    width: 200px;
    border-radius: 10px;
}
.gbaGif{
    position: absolute;
    width: 100px;
    right: 55px;
    bottom:32px;
    z-index: 1;
    border-radius: 3px
}

</style>
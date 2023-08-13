<template>
<div class="emulatorList">
    <div v-bind:to="emulator[0].name" class="videoGameCard" @mouseover="playSound(emulator[0])" @mouseout="pauseSound(emulator[0])"><router-link v-bind:to="emulator[0].routerLink"><img class="gbaGif" v-bind:src="emulator[0].gifImage" v-show="emulator[0].active"><img class="gbaGif" v-bind:src="emulator[0].blackImage" v-show="!emulator[0].active"><div><img class="gba" v-bind:src="emulator[0].imageUrl"></div></router-link></div>
    <div v-bind:to="emulator[1].name" class="videoGameCard" @mouseover="playSound(emulator[1])" @mouseout="pauseSound(emulator[1])"><router-link v-bind:to="emulator[1].routerLink"><img class="pspGif" v-bind:src="emulator[1].gifImage" v-show="emulator[1].active"><img class="pspBlack" v-bind:src="emulator[1].blackImage" v-show="!emulator[1].active"><div><img class="psp" v-bind:src="emulator[1].imageUrl"></div></router-link></div>
</div>
</template>


<script>

export default{ 
    data(){
    return{
        emulator: [
          {
            name: 'GBA',
            routerLink: '/emulatorlist/gba',
            imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pngkey.com%2Fpng%2Ffull%2F142-1425125_the-gameboy-advance-launched-in-japan-15-years.png&f=1&nofb=1&ipt=ec4334e682c75bb49bf8314d412ecf828981193c407f9c979afd53b2e5af08b2&ipo=images',
            gifImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.tenor.com%2FeU6-5B11bd8AAAAC%2Ftextgif-nintendo.gif&f=1&nofb=1&ipt=a311b60dce40429bb7bf275080543ae7ff50a571a49dd21ed75acc7ee8500c0a&ipo=images',
            blackImage: 'https://community.usa.canon.com/t5/image/serverpage/image-id/8218iBEAE12A7A45C909D?v=1.0',
            sound: new Audio('/audio/gba.mp3'),
            active: false,
          },
          {
            name: 'PSP',
            routerLink: '/emulatorlist/psp',
            imageUrl: 'https://hyperspin-fe.com/uploads/monthly_2017_05/591094ad43226_Bezel16x9SonyPSP(Horizontal).png.6fad00fd60766471d0384bcef7aacb7f.png',
            gifImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.makeagif.com%2Fmedia%2F8-10-2016%2Fmadrq_.gif&f=1&nofb=1&ipt=d2a71b39429109ee78bdf1af55fd58c7696239631b4f6a80d1e51d153c1ac871&ipo=images',
            blackImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F2563963.jpg&f=1&nofb=1&ipt=93572cde757009d05ba399ee26816879c6e047d1b6bb3a2b7021af42a3f16c28&ipo=images',
            sound: new Audio('/audio/psp.mp3'),
            active: false,
          }
            ]
      }
    },
    methods: {
    playSound (emulator) {
      if(emulator.sound) {
        emulator.active = true;
        emulator.sound.play(1);
      }
    },
    pauseSound(emulator) {
      if(emulator.sound) {
        emulator.active = false;
        emulator.sound.pause();
        emulator.sound.currentTime = 0;
      }
    }
    }
}

</script>

<style>
.emulatorList{
  display: flex;
}
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
.psp{
  width: 200px;
}
.pspGif{
  position: absolute;
    width: 110px;
    right: 50px;
    bottom:36px;
    z-index: 1;
    border-radius: 3px
}
.pspBlack{
  position: absolute;
    width: 110px;
    right: 50px;
    bottom:36px;
    z-index: 1;
    border-radius: 3px
}

</style>
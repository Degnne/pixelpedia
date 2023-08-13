<template>
  <div>
    <div><img src='https://officialpsds.com/imageview/7l/1k/7l1k14_large.png?1521316463' class='tv'></div>
    <div><wasmpsx-player ref="wasmpsxElement" class='screen'></wasmpsx-player></div>
    <div class='buttons'>
    <button @click="startEmulator">Start Game</button>
    <input type="file" ref="gameInput">
    </div>
  </div>
</template>

<script>
export default {
    name: 'ps1Emulator',
    data() {
    return {
        emulatorScript: null,
    };
},
    created() {
        window.Module = {
            locateFile: function(filename) {
                if (filename.endsWith('.wasm')) {
                    return '/wasmpsx_ww.wasm';
                }
                return filename;
            }
        };
        if (!document.querySelector('script[src="/wasmpsx.min.js"]')) {
        this.emulatorScript = document.createElement('script');
        this.emulatorScript.src = '/wasmpsx.min.js';
        document.head.appendChild(this.emulatorScript);
    }
    },
    beforeDestroy() {
      if (this.emulatorScript) {
        document.head.removeChild(this.emulatorScript);
        this.emulatorScript = null;
    }
    
  },
    methods:{
     loadGameFromFile() {
        const gameFile = this.$refs.gameInput.files[0];
        if (gameFile) {
          this.$refs.wasmpsxElement.readFile(gameFile);  // assuming readFile() accepts a File object
        } else {
          console.warn("No game file selected");
        }
      },
      startEmulator() {
            this.loadGameFromFile()
            if (window.AudioContext || window.webkitAudioContext) {
        const context = new (window.AudioContext || window.webkitAudioContext)();
        if (context.state === "suspended") {
            context.resume().then(() => {
                console.log("AudioContext resumed successfully");
            }).catch((error) => {
                console.error("Failed to resume AudioContext:", error);
            });
        }
      }
    }
  }
}
</script>

<style>
  /* Add any styles if needed */
  .tv{
    display: flex;
    position: relative;
    justify-content: center;
    z-index: 2;
    border-radius: 3px
  }
  .screen{
    display: flex;
    position: relative;
    top: -550px;
    z-index: 0;
    justify-content: center;
  }
  .buttons{
    display: flex;
    position: relative;
    top: -400px;
    justify-content: center;
    
  }
</style>
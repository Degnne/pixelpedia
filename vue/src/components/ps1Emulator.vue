<template>
  <body>
    <div>
      <img
        src="https://officialpsds.com/imageview/7l/1k/7l1k14_large.png?1521316463"
        class="tv"
      />
    </div>
    <div>
      <wasmpsx-player ref="wasmpsxElement" class="screen"></wasmpsx-player>
    </div>
    <div class="buttons">
      <button @click="startEmulator">Start Game</button>
      <input type="file" ref="gameInput" />
    </div>
  </body>
</template>

<script>
export default {
  name: "ps1Emulator",
  data() {
    return {
      emulatorScript: null,
      myGamePad: null,
      gamepadIndex: null,
      buttons: {
        0: 0, // Map gamepad button A to 'Z' key
        1: 1, // Map gamepad button B to 'X' key
        2: 2, // Map gamepad button X to 'S' key
        3: 3, // Map gamepad button Y to 'D' key
        4: 4, // Map gamepad button LB to 'w' key
        5: 5, // Map gamepad button RB to 'r' key
        6: 6, // Map gamepad button LT to 'e' key
        7: 7, // Map gamepad button RT to 't' key
        8: 8, // Map gamepad button View/share to 'C' key
        9: 9, // Map gamepad button Menu to 'V' key
        12: 12, // Map gamepad button Dir Up to 'ArrowUp' key
        13: 13, // Map gamepad button Dir Down to 'ArrowDown' key
        14: 14, // Map gamepad button Dir Left to 'ArrowLeft' key
        15: 15, // Map gamepad button Dir Right to 'ArrowRight' key
        // ... add more mappings as needed
      },
      // buttonStates: {
      //   0: false, // Map gamepad button A to 'Z' key
      //   1: false, // Map gamepad button B to 'X' key
      //   2: false, // Map gamepad button X to 'S' key
      //   3: false, // Map gamepad button Y to 'D' key
      //   4: false, // Map gamepad button LB to 'W' key
      //   5: false, // Map gamepad button RB to 'R' key
      //   6: false, // Map gamepad button LT to 'E' key
      //   7: false, // Map gamepad button RT to 'T' key
      //   8: false, // Map gamepad button View/share to 'C' key
      //   9: false, // Map gamepad button Menu to 'V' key
      //   12: false, // Map gamepad button Dir Up to 'ArrowUp' key
      //   13: false, // Map gamepad button Dir Down to 'ArrowDown' key
      //   14: false, // Map gamepad button Dir Left to 'ArrowLeft' key
      //   15: false, // Map gamepad button Dir Right to 'ArrowRight'
      // },
    };
  },
  beforeCreate() {
    window.Module = {
      locateFile: function (filename) {
        if (filename.endsWith(".wasm")) {
          return "/wasmpsx-master/wasmpsx_ww.wasm";
        }
        return filename;
      },
    };

    if (
      !document.querySelector('script[src="/wasmpsx-master/wasmpsx.min.js"]')
    ) {
      this.emulatorScript = document.createElement("script");
      this.emulatorScript.src = "/wasmpsx-master/wasmpsx.min.js";
      document.head.appendChild(this.emulatorScript);
      
    }

    // window.addEventListener("gamepadconnected", (event) => {
    //   this.gamepadIndex = event.gamepad.index;
    //   this.myGamePad = navigator.getGamepads()[this.gamepadIndex];
    //   console.log("gamepad connected");
    //   this.pollGamepad();
    // });

    // window.addEventListener("gamepaddisconnected", () => {
    //   this.gamepadIndex = null;
    //   console.log("gamepad Disconnected");
    // });

    // window.addEventListener("keydown", () => {
    //   //console.log(e);
    //   console.log("keypressed");
    // });
    // window.addEventListener("keyup", () => {
    //   //console.log(e);
    //   console.log("keyreleased");
    // });
  },
  // mounted() {
  //   const interval = setInterval(() => {
  //     if (window.Module && window.Module.fillGamepadEventData) {
  //       // Save a reference to the original function
  //       const originalFillGamepadEventData = window.Module.fillGamepadEventData;
  //       console.log("successful");

  //       // Override the function
  //       window.Module.fillGamepadEventData = function(e, t) {
  //           t.buttons = this.remapButtons(t.buttons);
  //           return originalFillGamepadEventData.call(this, e, t);
  //       };

  //       clearInterval(interval);
  //     }
  //   }, 50)
  // },
  beforeDestroy() {
    location.reload();
  },

  methods: {

    remapButtons(buttons) {
    // Your remapping logic here.
    // Example: swap button 0 and button 1
    const temp = buttons[6];
    this.buttons[6] = buttons[4];
    this.buttons[4] = temp;
},
    // pollGamepad() {
    //   this.myGamePad = navigator.getGamepads()[this.gamepadIndex];
      //const gamepad = gamepads[this.gamepadIndex];

      // if (!gamepad) return;

      // gamepad.buttons.forEach((button, index) => {
      //   if (button.pressed) {
      //     if (!this.buttonStates[index]) {
      //       console.log(`Button ${index} is pressed`);
      //       if (this.buttonToKeyMap[index]) {
      //         console.log(
      //           "button pressed" +
      //             " " +
      //             index +
      //             " " +
      //             this.buttonToKeyMap[index]
      //         );
      //         this.buttonStates[index] = true;
      //       }
      //     }
      //   } else {
      //     if (this.buttonStates[index]) {
      //       console.log(`Button ${index} is released`);
      //       this.buttonStates[index] = false;
      //     }
      //   }
      // });
      // console.log(this.myGamePad);
      // console.log(this.myGamePad.axes);
      // const stickThreshold = 0.5; // Adjust as needed

      // if (gamepad.axes[0] < -stickThreshold) {
      //   this.triggerKeyboardEvent("ArrowLeft"); // Left stick moved left
      // } else if (gamepad.axes[0] > stickThreshold) {
      //   this.triggerKeyboardEvent("ArrowRight"); // Left stick moved right
      // }

      // if (gamepad.axes[1] < -stickThreshold) {
      //   this.triggerKeyboardEvent("ArrowUp"); // Left stick moved up
      // } else if (gamepad.axes[1] > stickThreshold) {
      //   this.triggerKeyboardEvent("ArrowDown"); // Left stick moved down
      // }

      // if (gamepad.axes[2] < -stickThreshold) {
      //   this.triggerKeyboardEvent("d" + "ArrowLeft"); // Left stick moved up
      // } else if (gamepad.axes[2] > stickThreshold) {
      //   this.triggerKeyboardEvent("d" + "ArrowRight"); // Left stick moved down
      // }
      // if (gamepad.axes[3] < -stickThreshold) {
      //   this.triggerKeyboardEvent("d" + "ArrowUp"); // Left stick moved up
      // } else if (gamepad.axes[3] > stickThreshold) {
      //   this.triggerKeyboardEvent("d" + "ArrowDown"); // Left stick moved down
      // }

      // Continue polling

    //   window.requestAnimationFrame(this.pollGamepad);
    // },
    // triggerKeyUpEvent(key) {
    //   const myButton = document.body;
    //   const keyCodeValue = key.toUpperCase().charCodeAt(0);
    //   const keyCodes = {
    //     z: "KeyZ", // Map gamepad button A to 'Z' key
    //     x: "KeyX", // Map gamepad button B to 'X' key
    //     s: "KeyS", // Map gamepad button X to 'S' key
    //     d: "KeyD", // Map gamepad button Y to 'D' key
    //     w: "KeyW", // Map gamepad button LB to 'W' key
    //     r: "KeyR", // Map gamepad button RB to 'R' key
    //     e: "KeyE", // Map gamepad button LT to 'E' key
    //     t: "KeyT", // Map gamepad button RT to 'T' key
    //     c: "KeyC", // Map gamepad button View/share to 'C' key
    //     v: "KeyV", // Map gamepad button Menu to 'V' key
    //     ArrowUp: "ArrowUp",
    //     ArrowDown: "ArrowDown",
    //     ArrowLeft: "ArrowLeft",
    //     ArrowRight: "ArrowRight",
    //   };

    //   const dispatchKeyUpEvent = () => {
    //     const eventUp = new KeyboardEvent("keyup", {
    //       key: key,
    //       code: keyCodes[key],
    //       charCode: keyCodeValue,
    //       keyCode: keyCodeValue,
    //       which: keyCodeValue,
    //       bubbles: true,
    //       composed: true,
    //       view: window,
    //     });
    //     myButton.dispatchEvent(eventUp);
    //   };
    //   dispatchKeyUpEvent();
    // },
    // triggerKeyboardEvent(key) {
    //   const myButton = document.body;
    //   const keyCodeValue = key.toUpperCase().charCodeAt(0);
    //   const keyCodes = {
    //     z: "KeyZ", // Map gamepad button A to 'Z' key
    //     x: "KeyX", // Map gamepad button B to 'X' key
    //     s: "KeyS", // Map gamepad button X to 'S' key
    //     d: "KeyD", // Map gamepad button Y to 'D' key
    //     w: "KeyW", // Map gamepad button LB to 'W' key
    //     r: "KeyR", // Map gamepad button RB to 'R' key
    //     e: "KeyE", // Map gamepad button LT to 'E' key
    //     t: "KeyT", // Map gamepad button RT to 'T' key
    //     c: "KeyC", // Map gamepad button View/share to 'C' key
    //     v: "KeyV", // Map gamepad button Menu to 'V' key
    //     ArrowUp: "ArrowUp",
    //     ArrowDown: "ArrowDown",
    //     ArrowLeft: "ArrowLeft",
    //     ArrowRight: "ArrowRight",
    //   };
    //       const eventDown = new KeyboardEvent("keydown", {
    //         key: key,
    //         code: keyCodes[key],
    //         charCode: keyCodeValue,
    //         keyCode: keyCodeValue,
    //         which: keyCodeValue,
    //         bubbles: true,
    //         composed: true,
    //         view: window,
    //     });
    //     const eventPress = new KeyboardEvent("keypress", {
    //         key: key,
    //         code: keyCodes[key],
    //         charCode: keyCodeValue,
    //         keyCode: keyCodeValue,
    //         which: keyCodeValue,
    //         bubbles: true,
    //         composed: true,
    //         view: window,
    //     });
    //     myButton.dispatchEvent(eventDown);
    //     myButton.dispatchEvent(eventPress);
    // },
    loadGameFromFile() {
      const gameFile = this.$refs.gameInput.files[0];
      if (gameFile) {
        this.$refs.wasmpsxElement.readFile(gameFile);
      } else {
        console.warn("No game file selected");
      }
    },

    startEmulator() {
      this.loadGameFromFile();
      if (window.AudioContext || window.webkitAudioContext) {
        const context = new (window.AudioContext ||
          window.webkitAudioContext)();
        if (context.state === "suspended") {
          context
            .resume()
            .then(() => {
              console.log("AudioContext resumed successfully");
            })
            .catch((error) => {
              console.error("Failed to resume AudioContext:", error);
            });
        }
      }
    },
  },
};
</script>

<style>
/* Add any styles if needed */
.tv {
  display: flex;
  position: relative;
  justify-content: center;
  z-index: 2;
  border-radius: 3px;
}
.screen {
  display: flex;
  position: relative;
  top: -550px;
  z-index: 0;
  justify-content: center;
}
.buttons {
  display: flex;
  position: relative;
  top: -400px;
  justify-content: center;
}
</style>
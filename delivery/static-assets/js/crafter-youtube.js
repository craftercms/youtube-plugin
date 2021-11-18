const crafterYoutube = {
  initPlayer: function(id) {
    let playerState = -1
    let player = new YT.Player(id, {
      events: {
        'onStateChange': (event) => {
          playerState = event.data;
        }
      }
    });
    let zKeyPressed = false;

    const onKeyup = (e) => {
      if (e.key === 'z') {
        zKeyPressed = false;
      }
    };
    const onKeydown = (e) => {
      if (e.key === 'z') {
        zKeyPressed = true;
      }
    };

    document.addEventListener('keydown', onKeydown, false);
    document.addEventListener('keyup', onKeyup, false);
    document.querySelector(`#${id}-container`).addEventListener('click',
      (e) => {
        if (zKeyPressed) {
          // if state === playing
          if (playerState === 1) {
            player.pauseVideo()
          } else {
            player.playVideo();
          }
        }
      }
    );
  }
}
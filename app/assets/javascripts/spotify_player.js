function millisToMinutesAndSeconds(millis) {
    var minutes = Math.floor(millis / 60000);
    var seconds = ((millis % 60000) / 1000).toFixed(0);
    return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
}

window.onSpotifyWebPlaybackSDKReady = () => {
  let token = '';
  const player = new Spotify.Player({
    name: 'Moodify Player',
    getOAuthToken: cb => { cb(token); }
  });

    window._playPause = () => {
        player.togglePlay();
    }

    let _playPauseButton = document.querySelector('#playToggle');
    let _seekBar = document.querySelector('.progress .determinate');
    let _timePosition = document.querySelector('.time #value');

    _playPauseButton.addEventListener('click', _playPause)
    let updateProgress = (state) => {
        if(!state) return;
        _playPauseButton.setAttribute('class', state.paused ? 'far fa-play-circle' : 'far fa-pause-circle');
        _seekBar.style.width = (state.position / state.duration) * 100 + '%';
        _timePosition.innerText = millisToMinutesAndSeconds(state.position) + " / " + millisToMinutesAndSeconds(state.duration);
    }
    
    setInterval(() => {
        player.getCurrentState().then(state => {
            if(!state) return;
            _timePosition.innerText = millisToMinutesAndSeconds(state.position) + " / " + millisToMinutesAndSeconds(state.duration);
            updateProgress(state);
        })
    }, 500);

  // Error handling
  player.addListener('initialization_error', ({ message }) => { console.error(message); });
  player.addListener('authentication_error', ({ message }) => { console.error(message); });
  player.addListener('account_error', ({ message }) => { console.error(message); });
  player.addListener('playback_error', ({ message }) => { console.error(message); });

  // Playback status updates
    player.addListener('player_state_changed', state => {
        console.log(state);
        updateProgress(state);
    });

  // Ready
  player.addListener('ready', ({ device_id }) => {
      console.log('Ready with Device ID', device_id);
      window._spoti_device_id = device_id;
  });

  // Not Ready
  player.addListener('not_ready', ({ device_id }) => {
    console.log('Device ID has gone offline', device_id);
  });

    var request = new XMLHttpRequest();
    request.open('GET', '/api/v1/my/token', true);

    request.onload = function() {
        if (this.status >= 200 && this.status < 400) {
            // Success!
            var data = JSON.parse(this.response);
            token = data.token;
            window._spoti_access_token = data.token;
            player.connect();
        } else {
            // We reached our target server, but it returned an error
            console.error('Could not retrieve bearer token.')
        }
    };

    request.onerror = function(e) {
        console.error(e);
    };

    request.send();

    
};

let play = (uri) => {
    if(!uri) return _playPause();
    fetch(`https://api.spotify.com/v1/me/player/play?device_id=${window._spoti_device_id}`, {
        method: 'PUT',
        body: JSON.stringify({ uris: [uri] }),
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${window._spoti_access_token}`
        },
    });
}

document.addEventListener('DOMContentLoaded', () => {
    document.body.addEventListener('click', (e) => {
        if(e.target.parentElement.getAttribute('data-track-uri')) {
            let uid = e.target.parentElement.getAttribute('data-track-uri');

            play(uid);
        }
    })
 
});

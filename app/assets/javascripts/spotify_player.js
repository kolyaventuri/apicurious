window.onSpotifyWebPlaybackSDKReady = () => {
  let token = '';
  const player = new Spotify.Player({
    name: 'Moodify Player',
    getOAuthToken: cb => { cb(token); }
  });

  // Error handling
  player.addListener('initialization_error', ({ message }) => { console.error(message); });
  player.addListener('authentication_error', ({ message }) => { console.error(message); });
  player.addListener('account_error', ({ message }) => { console.error(message); });
  player.addListener('playback_error', ({ message }) => { console.error(message); });

  // Playback status updates
  player.addListener('player_state_changed', state => { console.log(state); });

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

    window._playPause = () => {
        player.togglePlay();
    }
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

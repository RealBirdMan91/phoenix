const Player = {
    player: null,
    init(domId, playerId, onReady) {
        window.onYouTubeIframeAPIReady = () => {
            this.onIframeReady(domId, playerId, onReady)
        }
        const youtubeScriptTag = document.createElement("script")
        youtubeScriptTag.src = "https://www.youtube.com/iframe_api"
        document.head.appendChild(youtubeScriptTag)
    },
    onIframeReady(domId, playerId, onReady) {
        this.player = new YT.Player(domId, {
            height: "360",
            width: "640",
            videoId: playerId,
            events: {
                "onReady": (event) => {
                    if (onReady) {
                        onReady(this.player)
                    }
                },
                "onStateChange": (event) => this.onPlayerStateChange(event)
            }
        })
    },

    onPlayerStateChange(event) { },
    getCurrentTime() {
        return Math.floor(this.player.getCurrentTime() * 1000)
    },
    seekTo(millsec) {
        return this.player.seekTo(millsec / 1000)
    }
}

export default Player
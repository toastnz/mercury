"use strict";(self.webpackChunkmercury=self.webpackChunkmercury||[]).push([[297],{297:(e,i,t)=>{t.r(i),t.d(i,{Video:()=>s});class s{constructor(e){this.video=e,this.video_id=this.video.dataset.videoId,this.video_element=this.video.dataset.id,this.video_source=this.video.dataset.videoSource,window.loaded_scripts=window.loaded_scripts||[],this.script_src="youtube"===this.video_source?"https://www.youtube.com/iframe_api":"https://player.vimeo.com/api/player.js",this.init()}init(){this.loadScripts(),this.addEventListeners()}addEventListeners(){this.video.addEventListener("click",(e=>{e.preventDefault(),this.create()}))}loadScripts(){if(window.loaded_scripts.includes(this.script_src))return;window.loaded_scripts.push(this.script_src);let e=document.createElement("script");e.src=this.script_src,document.body.appendChild(e)}onPlayerReady(){this.show(),this.player.playVideo()}onPlayerStateChange(e){e.data==YT.PlayerState.ENDED&&(this.player.seekTo(0),this.player.pauseVideo(),this.hide())}create(){this.player?this.play():("youtube"===this.video_source&&(this.player=new YT.Player(this.video_element,{videoId:this.video_id,events:{onReady:this.onPlayerReady.bind(this),onStateChange:this.onPlayerStateChange.bind(this)}})),"vimeo"===this.video_source&&(this.player=new Vimeo.Player(this.video_element,{id:this.video_id,autopause:!1}),this.player.on("play",(()=>this.show())),this.player.on("ended",(()=>this.hide())),this.show(),this.play()))}play(){this.show(),"youtube"===this.video_source?this.player.playVideo():this.player.play()}show(){this.video.classList.add("playing")}hide(){this.video.classList.remove("playing")}}}}]);
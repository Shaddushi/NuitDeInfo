<script setup>
	import { defineEmits } from "vue";

  const emit = defineEmits(['update'])

  document.addEventListener("DOMContentLoaded", () => {
	var canvas = document.createElement("canvas");
	var ctx = canvas.getContext("2d");
	canvas.width = 460;
	canvas.height = 480;

	let element = document.getElementById("game");
	let initial_txt = element.innerHTML;
	element.appendChild(canvas);	

	let r = 1;
	let s = 1;
	let bgReady = false;
	let bgImage = new Image();
	bgImage.onload = function(){
		ctx.drawImage(bgImage, 0, 0);
		bgReady = true;
	};
	bgImage.src = "../../../NuitDeLInfo/src/assets/background/Background.png";

	let tortueReady = false;
	let tortueImage = new Image();
	tortueImage.onload = function(){
		tortueReady = true;
	}
	tortueImage.src = "../../../NuitDeLInfo/src/assets/sprite/tortue.png";

	let liste = [];
	let tortue = {
		r: 1,
		s: 1,
		x: 32 + (Math.random() * (canvas.width - 96)),
		y: 32 + (Math.random() * (canvas.width - 96)),
		v: 1
	};

	let poissons = {
		x:0,
		y:0,
		r:1,
		s:1,
		c: Math.round(Math.random() * 4)
	};

	let noms = ["../../../NuitDeLInfo/src/assets/sprite/baleine.png", "../../../NuitDeLInfo/src/assets/sprite/dauphin.png", "../../../NuitDeLInfo/src/assets/sprite/espadon.png", "../../../NuitDeLInfo/src/assets/sprite/requin.png"];

	let poisson1Ready = false;
	let poisson1Image = new Image();
	poisson1Image.onload = function(){
		poisson1Ready = true;
	}
	poisson1Image.src = noms[0];

	let poisson2Ready = false;
	let poisson2Image = new Image();
	poisson2Image.onload = function(){
		poisson2Ready = true;
	}
	poisson2Image.src = noms[1];

	let poisson3Ready = false;
	let poisson3Image = new Image();
	poisson3Image.onload = function(){
		poisson3Ready = true;
	}
	poisson3Image.src = noms[2];

	let poisson4Ready = false;
	let poisson4Image = new Image();
	poisson4Image.onload = function(){
		poisson4Ready = true;
	}
	poisson4Image.src = noms[3];

	let poissons2 = {
		x: -32,
		y: -32,
		c: 0
	};

	let poissonsAttrapes = 0;

	let touchesAppuyees = {};

	addEventListener("keydown", function(e){
		if ([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
			e.preventDefault();
			touchesAppuyees[e.keyCode] = true;
		}
	}, false);

	addEventListener("keyup", function(e) {
		if ([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
			e.preventDefault();
			delete touchesAppuyees[e.keyCode];
		}
	}, false);

	var reset = function(){
		tortue.x = canvas.width / 2 - 16;
		tortue.y = canvas.height / 2 - 16;

		poisson.x = 32 + (Math.random() * (canvas.width - 96));
		poisson.y = 32 + (Math.random() * (canvas.width - 96));

		for(let l = 0; l < liste.length; l++) {
			liste[l].x = 32 + (Math.random() * (canvas.width - 96));
			liste[l].y = 32 + (Math.random() * (canvas.height - 96));
		}
	}

	var reset1 = function() {
		for (let l = 0; l < liste.length; l++) {
			liste[l].x = 32 + (Math.random() * (canvas.width - 96));
			liste[l].y = 32 + (Math.random() * (canvas.height - 96));
		}
	}

	var update = function(modifier){
		if(liste.length == 0){
			let i=0;
			while(i < 400){
				let temp_poisson = {
					x: 32 + (Math.random() * (canvas.width - 96)),
					y: 32 + (Math.random() * (canvas.width - 96)),
					r: Math.round(Math.random()) * 2 - 1,
					s: Math.round(Math.random()) * 2 - 1,
					v: (Math.random() + 0.5) / 2,
					c: Math.round(Math.random() * 3)
				}
				liste.push(temp_poisson);
				i=i+1;
			}
		}

		tortue.r = (tortue.x >= 440) ? -1 : tortue.r;
		tortue.r = (tortue.x <= 0) ? 1 : tortue.r;
		tortue.s = (tortue.y >= 461) ? -1 : tortue.s;
		tortue.s = (tortue.y <= 0) ? 1 : tortue.s;
		tortue.x = tortue.x + (tortue.v * tortue.r);
		tortue.y = tortue.y + (tortue.v * tortue.s);
		
		let i=0;
		while(i < liste.length){
			if(liste[i].x >= 440){
				liste[i].r = Math.round(Math.random()) * 2 - 1;
				liste[i].x = 32 + (Math.random() * (canvas.width - 96));
				liste[i].y = 32 + (Math.random() * (canvas.width - 96));

			}
			if(liste[i].x <= 0){
				liste[i].r = Math.round(Math.random()) * 2 - 1;
				liste[i].x = 32 + (Math.random() * (canvas.width - 96));
				liste[i].y = 32 + (Math.random() * (canvas.width - 96));
			}
			if(liste[i].y >= 461){
				liste[i].s = Math.round(Math.random()) * 2 - 1;
				liste[i].x = 32 + (Math.random() * (canvas.width - 96));
				liste[i].y = 32 + (Math.random() * (canvas.width - 96));
			}
			if(liste[i].y <= 0){
				liste[i].s = Math.round(Math.random()) * 2 - 1;
				liste[i].x = 32 + (Math.random() * (canvas.width - 96));
				liste[i].y = 32 + (Math.random() * (canvas.width - 96));
			}
			liste[i].x = liste[i].x + (liste[i].v * liste[i].r);
			liste[i].y = liste[i].y + (liste[i].v * liste[i].s);
			i=i+1;
		}
	}

	var render = function(){
		const taille = 32;
		let i=0;
		if(bgReady){
			ctx.drawImage(bgImage, 0, 0);
		}
		if(tortueReady){
			ctx.drawImage(tortueImage, tortue.x, tortue.y, taille, taille);
		}
		while(i < liste.length){
			if(liste[i].c == 0 && poisson1Ready){
				ctx.drawImage(poisson1Image, liste[i].x, liste[i].y, taille, taille);
			}
			if(liste[i].c == 1 && poisson2Ready){
				ctx.drawImage(poisson2Image, liste[i].x, liste[i].y, taille, taille);
			}
			if(liste[i].c == 2 && poisson3Ready){
				ctx.drawImage(poisson3Image, liste[i].x, liste[i].y, taille, taille);
			}
			if(liste[i].c == 3 && poisson4Ready){
				ctx.drawImage(poisson4Image, liste[i].x, liste[i].y, taille, taille);
			}
			i=i+1;
		}
	}

	element.addEventListener("mousedown", function(e){
		if((e.offsetX <= tortue.x + 32 && e.offsetX >= tortue.x)
		&& (e.offsetY <= tortue.y + 32 && e.offsetY >= tortue.y)){
			end();
		}
	})


	function end(){
    const hasEnd = true
    emit("update", hasEnd)
		console.log("Touché");
	}
	let play_game = false;

	document.getElementById("play").addEventListener("click", () => {
		play_game = true;
	})

	var main = function(){
		if(play_game){
			update(1);
			render();
			let audioElement = document.getElementById("audio");
			if(audio.paused){
				audio.play();
			}
		}
	}


	setInterval(main, 10);
})
</script>

<template>
  <div class="captcha-game">
    <audio id="audio" src="../../../NuitDeLInfo/src/assets/music/Kubbi-Ember-04Cascade.mp3" autoplay hidden></audio>
    <div id="game">
    </div>
    <button id="play">Play</button>
  </div>
</template>
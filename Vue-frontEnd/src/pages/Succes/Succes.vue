<script setup>
	import axios from "axios";
	import {ref} from "vue";
	const pseudo = ref('')
	let liste =
		[{
			"nom": "Succès 1",
			"description": "Desc 1",
			"image": "../../../NuitDeLInfo/src/assets/sprite/tortue.png",
			"debloque": true
		},{
			"nom": "Succès 2",
			"description": "Desc 2",
			"image": "../../../NuitDeLInfo/src/assets/sprite/tortue.png",
			"debloque": false
		}]
</script>

<template>
	<div>
		<template v-for="l in liste" class="row">
			<img :src="l.image"/>
			<div class="column">
				<p>{{ l.nom }}</p>
				<p>{{ l.description }}</p>
			</div>
		</template>
	</div>
</template>
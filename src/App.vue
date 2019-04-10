<template>
	<div id="app">
		<router-view />
	</div>
</template>
<style>
	@import url("//at.alicdn.com/t/font_1065691_l28v8faezfa.css");
	@import url("styles/app.css");
	#app {
		width: 100%;
		height: 100%;
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
	.full {
		width: 100%;
		height: 100%;
	}
	
	.page {
		width: 100%;
		min-height: 100%;
		padding: 10px;
		background: white;
		box-sizing: border-box;
	}
</style>

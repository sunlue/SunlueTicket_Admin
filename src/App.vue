<template>
	<div id="app"><router-view /></div>
</template>
<style lang="less">
	@import url('//at.alicdn.com/t/font_1065691_ox4wrqqg01.css');
	@import url('styles/app.css');
	@import url('styles/theme/default.less');
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
		height: 100%;
		padding: 10px;
		background: white;
		box-sizing: border-box;
		position: relative;
	}
	
	.echarts {
		&,
		& > div:first-child,
		& > div > canvas {
			width: 100% !important;
		}
	}
</style>

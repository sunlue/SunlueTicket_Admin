module.exports = {
	devServer: {
		proxy: 'http://ticket.sunlue.io/api/'
	},
	pages: {
		index: {
			entry: 'src/main.js',
			title: 'SunlueTICKET票务管理系统',
		}
	},
	transpileDependencies: [
		'vue-echarts',
		'resize-detector'
	],
	productionSourceMap: false,
}

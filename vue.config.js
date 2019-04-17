module.exports = {
	devServer: {
		proxy: 'http://ticket.sunlue.cn/api/'
	},
	transpileDependencies: [
		'vue-echarts',
		'resize-detector'
	]
}

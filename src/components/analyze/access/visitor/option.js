const option = {
	line: function(data) {
		var colors = ['#5793f3', '#d14a61', '#675bba', '#009688'];
		return {
			color: colors,
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'cross'
				}
			},
			grid: {
				top: 100,
				left: 200,
				right: 10,
				bottom: 24
			},
			toolbox: {
				feature: {
					magicType: {
						show: true,
						type: ['line', 'bar']
					},
					restore: {
						show: true
					},
					saveAsImage: {
						show: true,
						name: '访客统计'
					}
				}
			},
			legend: {
				left: 20,
				data: ['浏览次数(pv)', '独立访客(uv)', '独立ip']
			},
			xAxis: [{
				type: 'category',
				axisTick: {
					alignWithLabel: true
				},
				data: data.week
			}],
			yAxis: [{
				type: 'value',
				name: '浏览次数(pv)',
				position: 'left',
				offset: 150,
				axisLine: {
					lineStyle: {
						color: colors[0]
					}
				},
			}, {
				type: 'value',
				name: '独立访客(uv)',
				position: 'left',
				offset: 70,
				axisLine: {
					lineStyle: {
						color: colors[1]
					}
				},
			}, {
				type: 'value',
				name: '独立ip',
				position: 'left',
				axisLine: {
					lineStyle: {
						color: colors[2]
					}
				}
			}],
			series: [{
					name: '浏览次数(pv)',
					type: 'line',
					data: data.pv
				}, {
					name: '独立访客(uv)',
					type: 'line',
					yAxisIndex: 1,
					data: data.uv
				}, {
					name: '独立ip',
					type: 'line',
					yAxisIndex: 2,
					data: data.ip
				},
			]
		};
	},
	bar: function(data) {
		return {
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'shadow'
				}
			},
			legend: {
				data: ['浏览次数(pv)', '独立访客(uv)', '独立ip']
			},
			grid: {
				left: '3%',
				right: '3%',
				bottom: '3%',
				containLabel: true
			},
			xAxis: [{
				type: 'category',
				data: data.date
			}],
			yAxis: [{
				type: 'value'
			}],
			series: [{
				name: '浏览次数(pv)',
				type: 'bar',
				data: data.pv,
				markLine: {
					lineStyle: {
						normal: {
							type: 'dashed'
						}
					},
					data: [[
							{
								type: 'min',
						}, {
								type: 'max',
						}]
					]
				}
			}, {
				name: '独立访客(uv)',
				type: 'bar',
				data: data.uv,
				markLine: {
					lineStyle: {
						normal: {
							type: 'dashed'
						}
					},
					data: [[
						{
							type: 'min'
						}, {
							type: 'max'
						}
					]]
				}
			}, {
				name: '独立ip',
				type: 'bar',
				data: data.ip,
				markLine: {
					lineStyle: {
						normal: {
							type: 'dashed'
						}
					},
					data: [[
							{
								type: 'min'
						}, {
								type: 'max'
						}]
					]
				}
			}]
		};
	}
}

export default option;
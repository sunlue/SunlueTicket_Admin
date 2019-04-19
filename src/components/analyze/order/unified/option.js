const option = {
	line: function(data) {
		var colors = ['#5793f3', '#d14a61', '#675bba', "#3d52fa",'#009688',"#27dec6","#f724d7",,"#ff4958"];
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
				left: 100,
				right: 160,
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
						name: '订单统计'
					}
				}
			},
			legend: {
				left: 20,
				data: ['订单数', '退单数', '出票数','退票数','验票数']
			},
			xAxis: [{
				type: 'category',
				axisTick: {
					alignWithLabel: true
				},
				data: data.date
			}],
			yAxis: [{
				type: 'value',
				name: '订单数',
				position: 'left',
				offset: 70,
				axisLine: {
					lineStyle: {
						color: colors[0]
					}
				},
			}, {
				type: 'value',
				name: '退单数',
				position: 'left',
				offset: 10,
				axisLine: {
					lineStyle: {
						color: colors[1]
					}
				},
			},{
				type: 'value',
				name: '出票数',
				position: 'right',
				offset: 130,
				axisLine: {
					lineStyle: {
						color: colors[2]
					},
				}
			},{
				type: 'value',
				name: '退票数',
				position: 'right',
				offset: 70,
				axisLine: {
					lineStyle: {
						color: colors[3]
					},
				}
			},{
				type: 'value',
				name: '验票数',
				position: 'right',
				offset: 10,
				axisLine: {
					lineStyle: {
						color: colors[4]
					}
				}
			}],
			series: [{
					name: '订单数',
					type: 'line',
					yAxisIndex: 0,
					data: data.order_total
				}, {
					name: '退单数',
					type: 'line',
					yAxisIndex: 1,
					data: data.order_refund
				}, {
					name: '出票数',
					type: 'line',
					yAxisIndex: 2,
					data: data.ticket_total
				},{
					name: '退票数',
					type: 'line',
					yAxisIndex: 3,
					data: data.ticket_refund
				},{
					name: '验票数',
					type: 'line',
					yAxisIndex: 4,
					data: data.ticket_check
				},
			]
		};
	}
}

export default option;
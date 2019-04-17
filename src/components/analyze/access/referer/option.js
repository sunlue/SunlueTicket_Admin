const option = {
	pie: function(data) {
		var colors = ['#5793f3', '#d14a61', '#675bba', '#009688','rgb(57, 61, 73)'];
		return {
			color: colors,
			title: {
				text: new Date().getFullYear() + '年' + (new Date().getMonth() + 1) + '月',
				left: 'left'
			},
			tooltip: {
				trigger: 'item',
				formatter: "{b} <br/> {c} ({d}%)"
			},
			legend: {
				bottom: 0,
				left: 'center',
				data: data.date
			},
			toolbox: {
				feature: {
					saveAsImage: {
						show: true,
						name: '用户来源分析'
					}
				}
			},
			series: [
				{
					type: 'pie',
					radius: '60%',
					center: ['50%', '52%'],
					selectedMode: 'single',
					data: data.data,
					itemStyle: {
						emphasis: {
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowColor: 'rgba(0, 0, 0, 0.5)'
						}
					}
                }
            ]
		};
	},
}

export default option;

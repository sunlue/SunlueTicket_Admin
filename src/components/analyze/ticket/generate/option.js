const option = {
	pie: function(data) {
		var colors = ['#5793f3', '#d14a61', '#675bba', '#009688',"#3d52fa","#27dec6","#f724d7","#ff4958"];
		return {
			color: colors,
			tooltip: {
				trigger: 'item',
				formatter: "{b} <br/> {c} ({d}%)"
			},
			legend: {
				top:5,
				left: 'left',
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
					center: ['50%', '60%'],
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

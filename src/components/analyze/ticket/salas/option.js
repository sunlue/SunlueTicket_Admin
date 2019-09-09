const option = {
	bar: function(data) {
		return {
			color:['#5793f3', '#d14a61', '#675bba', "#3d52fa",'#009688',"#27dec6","#f724d7","#ff4958"],
			title: {
				show: data.legend.length > 0 ? false : true,
				text: '暂无销售数据',
				x: 'center',
				y: 'center'
			},
			tooltip : {
				trigger: 'axis',
				axisPointer : {
					type : 'shadow'
				}
			},
			legend: {
				data:data.legend
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			xAxis : [
				{
					type : 'category',
					data : data.date
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : data.series
		};
	}
}

export default option;
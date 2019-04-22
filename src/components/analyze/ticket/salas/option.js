const option = {
	bar: function(data) {
		return {
			color:['#5793f3', '#d14a61', '#675bba', "#3d52fa",'#009688',"#27dec6","#f724d7","#ff4958"],
			tooltip : {
				trigger: 'axis',
				axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
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
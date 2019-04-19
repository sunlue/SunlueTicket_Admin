<template>
	<div class="big">
		<div class="header">
			<div class="left">
				<span class="date">2019年04月17日</span>
				<span class="week">星期三</span>
			</div>
			<div class="title"><span>上略互动数据可视化平台</span></div>
			<div class="right"><span>已连接socket</span></div>
		</div>
		<div class="count">
			<div class="item">
				<span class="iconfont icon-count_view"></span>
				<span class="text">今日销售：</span>
				<span class="number">
					<b v-for="(n,i) in count.salas" :key="i">{{ n }}</b>
				</span>
				<span class="unit">元</span>
			</div>
			<div class="item">
				<span class="iconfont icon-count_view"></span>
				<span class="text">累计销售：</span>
				<span class="number">
					<b v-for="(n,i) in count.salas" :key="i">{{ n }}</b>
				</span>
				<span class="unit">元</span>
			</div>
			<div class="item">
				<span class="iconfont icon-count_view"></span>
				<span class="text">今日票务：</span>
				<span class="number">
					<b v-for="(n,i) in count.salas" :key="i">{{ n }}</b>
				</span>
				<span class="unit">张</span>
			</div>
			<div class="item">
				<span class="iconfont icon-count_view"></span>
				<span class="text">累计票务：</span>
				<span class="number">
					<b v-for="(n,i) in count.salas" :key="i">{{ n }}</b>
				</span>
				<span class="unit">张</span>
			</div>
		</div>

		<div class="content">
			<div class="row">
				<div class="col col-3">
					<div class="data col-24">
						a
					</div>
				</div>
				<div class="col col-3">
					<div class="data col-24">
						a
					</div>
				</div>
				<div class="col col-12">
					<div class="data col-24">
						<v-chart :options="option.geo" theme="big-data" :autoresize="true" />
					</div>
				</div>
				<div class="col col-3">
					<div class="data">
						<strong>在线用户列表</strong>
						<ul class="">
							<li>张三</li>
						</ul>
					</div>
				</div>
				<div class="col col-3">
					<div class="data">
						<strong>在线用户列表</strong>
						<ul class="">
							<li>张三</li>
						</ul>
					</div>
				</div>
				<div class="col col-3">
					<div class="data col-24">
						a
					</div>
				</div>
				<div class="col col-3">
					<div class="data col-24">
						a
					</div>
				</div>
				<div class="col col-3">
					<div class="data col-24">
						a
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import bigData from '@/components/views';
import countTo from 'vue-count-to';
export default {
	name: 'views',
	components: {
		countTo
	},
	data() {
		return {
			option: {
				geo: {},
				map: {}
			},
			count: {
				salas: this.numberToB(parseInt(Math.random() * 10000))
			}
		};
	},
	created() {
		bigData.geo().then(data => {
			this.option.geo = data;
		});
		let that = this;
		setInterval(()=>{
			let arr = that.numberToB(parseInt(Math.random() * 10000));
			that.count.salas = arr;
			that.startVal=2017;
			that.endVal=2019;
		},3000)
	},
	methods: {
		numberToB(number) {
			let length = number.toString().length;
			let arr = new Array();
			for (let i = 0; i < length; i++) {
				arr.push(number.toString().substr(i, 1));
			}
			return arr;
		}
	}
};
</script>

<style lang="less">
.echarts {
	&,
	& > div:first-child,
	& > div > canvas {
		height: 100% !important;
	}
}

.big {
	background: #050714;
	width: 100vw;
	height: 100vh;
	.header {
		background: #121d49;
		border-bottom: 1px solid #38558e;
		width: 100%;
		position: relative;
		padding: 5px;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		color: white;
		margin-bottom: 28px;
		& > div {
			font-size: 14px;
		}
		.left {
			.date,
			.week {
				padding: 0px 5px;
			}
		}
		.right {
			padding-right: 10px;
		}
		.title {
			position: absolute;
			color: white;
			left: 50%;
			transform: translateX(-50%);
			top: 0px;
			font-size: 28px;
			text-align: center;
			font-family: '微软雅黑';
			font-weight: 100;
			min-width: 380px;
			span {
				z-index: 1;
				display: block;
				padding: 0px 50px;
			}
			&:after {
				content: '';
				display: block;
				border-bottom: 12px solid #121d49;
				border-left: 18px solid transparent;
				border-right: 18px solid transparent;
				transform: rotate(180deg);
				position: absolute;
				top: 30px;
				width: 100%;
				z-index: -1;
			}
		}
	}

	.count {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		padding: 0px 10px;
		.item {
			display: flex;
			flex-direction: row;
			justify-content: flex-end;
			align-items: center;
			align-content: center;
			span {
				display: inline;
			}
			.iconfont {
				font-size: 20px;
				color: yellow;
			}
			.text {
				padding-left: 10px;
				font-size: 20px;
				color: white;
				font-weight: 100;
			}
			.number {
				font-family: '楷体';
				font-size: 32px;
				letter-spacing: 1px;
				b {
					background: white;
					color: rgb(5, 39, 175);
					margin: 0px 2px;
					padding: 0px 2px;
					display: inline;
				}
			}
			.unit {
				color: white;
				padding-left: 5px;
				font-size: 10px;
			}
		}
	}
	.content {
		display: flex;
		height: calc(100vh - 108px);
		flex-direction: column;
		padding: 5px;
		background: white;
	}

	.row {
		margin: -5px;
		display: flex;
		flex-wrap:wrap;
		justify-content: flex-start;
// 		align-items: flex-start;
// 		align-content: flex-start;
		height: 100%;
		.col {
			margin: 5px;
			position: relative;
			strong{
				height: 28px;
				font-size: 16px;
				color: #38558e;
				&:before{
					content: '\e706';
					display: inline;
					padding-right: 5px;
					font-family: "iconfont";
				}
			}
		}
		
		.col-1 {
			width: calc(100% / 24 - 10px);
		}
		.col-2 {
			width: calc(100% / 12 - 10px);
		}
		.col-3 {
			width: calc(100% / 8 - 10px);
		}
		.col-4 {
			width: calc(100% / 6 - 10px);
		}
		.col-6 {
			width: calc(100% / 4 - 10px);
		}
		.col-12 {
			width: calc(100% / 2 - 10px);
		}
		.col-24 {
			width: 100%;
		}
		
		.data{
			padding: 5px;
			background: #0d143c;
			height: 100%;
		}
		
		.data:before,.data:after {
			content: '';
			display: block;
			width: 30px;
			height: 30px;
			background-image: url('../assets/views/cardBg.png');
			background-size: 100% 100%;
			background-repeat: no-repeat;
			position: absolute;
		}
		.data:before {
			right: 0px;
			top: 0px;
			transform: rotate(90deg);
		}
		.data:after {
			left: 0px;
			bottom: 0px;
			transform: rotate(-90deg);
		}
		
		
	}
}
</style>

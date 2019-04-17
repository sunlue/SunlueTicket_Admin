<template>
	<div class="page">
		<Row class="overview">
			<Col span="24">
			<Col span="4" class="col" v-for="i in 6" :key="i">
			<div class="total">
				<div class="pull-left">
					<Icon type="ios-albums" class="icon" />
				</div>
				<div class="pull-left">
					<span>20</span>
					<p>订单总数</p>
				</div>
			</div>
			</Col>
			</Col>
		</Row>
		
		<Row>
			<Col span="16">
			<Col span="12" v-if="false">
			<Card>
				<p slot="title"><span>票务订单</span></p>
				<a href="#" slot="extra">查看详情</a>
				<v-chart :options="option" />
			</Card>
			</Col>
			</Col>
			<Col span="8">
				
				
			</Col>
		</Row>
	</div>
</template>

<style lang="less">
	.overview {
		background: white;
		padding: 5px;
		text-align: center;
		margin: -5px;

		.col {
			padding: 5px;

			.total {
				height: 90px;
				border-radius: 5px;
				background: #f2f2f2 !important;
			}
		}

		.icon {
			font-size: 40px !important;
			color: #fff;
			display: inline-block;
		}

		.pull-left:first-child {
			width: 40%;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			line-height: 90px;
			background-color: #393D49 !important
		}

		.pull-left:last-child {
			width: 60%;
			align-items: center;
			padding: 17px 0px;
			box-sizing: border-box;

			span {
				font-size: 26px;
				display: block;
				height: 34px;
				color: #009688;
			}

			p {
				height: 22px;
				line-height: 22px;
			}
		}
	}
</style>

<script>
	import order from '@/views/echart/order'

	export default {
		name: 'index',
		components: {},
		data() {
			return {
				option: order
			}
		},
		mounted() {
			console.log(this.$store)
		},
		watch: {},
		methods: {}
	}
</script>

<style lang="less">
	
</style>

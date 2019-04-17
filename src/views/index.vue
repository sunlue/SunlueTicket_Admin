<template>
	<div class="page">
		<Row class="overview">
			<Col span="24">
				<Col :xs="{span:24}" :sm="{span:12}" :md="{span:8}" :xl="{span:4}" class="col" v-for="(item,index) in total" :key="index">
					<div class="total">
						<div class="pull-left" :style="'background-color:'+item.bgColor">
							<Icon :type="item.icon" class="icon" />
						</div>
						<div class="pull-left">
							<span>{{item.count}}</span>
							<p>{{item.title}}</p>
						</div>
					</div>
				</Col>
			</Col>
		</Row>
		<Row class="space">
			<Col span="24">
				<Col span="16" class="col">
					<Card>
						<p slot="title"><span>本周访问量</span></p>
						<v-chart :options="echats.access.visitor" />
					</Card>
				</Col>
				<Col span="8" class="col">
					<Card>
						<p slot="title"><span>用户访问来源</span></p>
						<v-chart :options="echats.access.referer" />
					</Card>
				</Col>
			</Col>
		</row>
	</div>
</template>

<style lang="less">
	.space{
		padding: 5px;
		margin: -5px;
		.col{
			padding: 5px;
		}
	}
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
			background-color: #393D49;
		}

		.pull-left:last-child {
			width: 60%;
			align-items: center;
			padding: 4px 0px;
			box-sizing: border-box;

			span {
				font-size: 40px;
				display: block;
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
	import analyze from '@/components/analyze'
	export default {
		name: 'index',
		components: {},
		data() {
			return {
				echats:{
					access:{
						visitor:{},
						referer:{},
					}
				},
				total:[{
					bgColor:'#393D49',
					icon:'md-person-add',
					title:'新增用户',
					count:20
				},{
					bgColor:'#FFB800',
					icon:'md-person-add',
					title:'累计点击',
					count:20
				},{
					bgColor:'#2F4056',
					icon:'md-person-add',
					title:'新增问答',
					count:20
				},{
					bgColor:'#1E9FFF',
					icon:'md-person-add',
					title:'分享统计',
					count:20
				},{
					bgColor:'#009688',
					icon:'md-person-add',
					title:'新增互动',
					count:20
				},{
					bgColor:'#FF5722',
					icon:'md-person-add',
					title:'新增页面',
					count:20
				}]
			}
		},
		mounted() {
			analyze.access.visitor('line').then((data)=>{
				this.echats.access.visitor=data;
			})
			analyze.access.referer('pie').then((data)=>{
				this.echats.access.referer=data;
			})
		},
		watch: {},
		methods: {}
	}
</script>

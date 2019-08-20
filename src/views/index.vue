<template>
	<div tag="page" class="page">
		<div class="scroll-y">
			<Row class="overview">
				<Col span="24">
					<div v-for="(items,index) in total" :key="index">
					<Col :xs="{span:24}" :sm="{span:12}" :md="{span:8}" :xl="{span:4}" class="col" v-for="(item,index) in items" :key="index">
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
					</div>
				</Col>
			</Row>
			<Row class="space">
				<Col span="24">
					<Col span="16" class="col">
						<Card>
							<p slot="title"><span>票务销售分析</span></p>
							<v-chart :options="echats.ticket.salas" :autoresize="true" />
						</Card>
					</Col>
					<Col span="8" class="col">
						<Card>
							<p slot="title"><span>票务出票分析</span></p>
							<v-chart :options="echats.ticket.generate" :autoresize="true" />
						</Card>
					</Col>
					<Col span="24" class="col">
						<Card>
							<p slot="title"><span>本月订单量</span></p>
							<v-chart :options="echats.order.unified" :autoresize="true" />
						</Card>
					</Col>
					<Col span="16" class="col">
						<Card>
							<p slot="title"><span>本周访问量</span></p>
							<v-chart :options="echats.access.traffic" :autoresize="true" />
						</Card>
					</Col>
					<Col span="8" class="col">
						<Card>
							<p slot="title"><span>用户访问来源</span></p>
							<v-chart :options="echats.access.referer" :autoresize="true" />
						</Card>
					</Col>
				</Col>
			</row>
		</div>
	</div>
</template>

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
						traffic:{},
					},
					order:{
						unified:{}
					},
					ticket:{
						generate:{},
						salas:{}
					}
				},
				total:{
					member:{
						'all':{
							bgColor:'#FFB800',
							icon:'md-person-add',
							title:'用户总数',
							count:0
						},
						'today':{
							bgColor:'#393D49',
							icon:'md-person-add',
							title:'新增用户',
							count:0
						}
					},
					ticket:{
						'all':{
							bgColor:'#1E9FFF',
							icon:'md-person-add',
							title:'出票总数',
							count:0
						},
						'today':{
							bgColor:'#2F4056',
							icon:'md-person-add',
							title:'今日出票',
							count:0
						}
					},
					earn:{
						'today':{
							bgColor:'#009688',
							icon:'md-person-add',
							title:'今日收益',
							count:'0.00'
						},
						'all':{
							bgColor:'#FF5722',
							icon:'md-person-add',
							title:'收益总数',
							count:'1.00'
						}
					}
				}
			}
		},
		created(){
			this.$store.dispatch('getTotalBasis').then((result) => {
				for(let i in result){
					for(let j in result[i]){
						let type=result[i][j]['type'];
						this.total[i][type]['count']=result[i][j]['total']
					}
				}
			})
		},
		mounted() {
			analyze.access.referer('pie').then((data)=>{
				this.echats.access.referer=data;
			})
			analyze.access.traffic().then((data)=>{
				this.echats.access.traffic=data;
			})
			analyze.order.unified().then((data)=>{
				this.echats.order.unified=data;
			})
			analyze.ticket.generate().then((data)=>{
				this.echats.ticket.generate=data;
			})
			analyze.ticket.salas().then((data)=>{
				this.echats.ticket.salas=data;
			})
		}
	}
</script>

<style lang="less">
	div[tag="page"]{
		padding:0px;
		.scroll-y{
			position: absolute;
			width: 100%;
			padding: 10px 5px;
		}
	}
	.space{
		padding: 5px;
		margin: -5px;
		.col{
			padding: 5px;
			.ivu-card+.ivu-card{
				margin-top:10px; 
			}
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
				line-height: 60px;
			}

			p {
				height: 22px;
				line-height: 22px;
			}
		}
	}
</style>
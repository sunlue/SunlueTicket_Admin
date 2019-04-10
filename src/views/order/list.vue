<template>
	<div class="page order_list_page">
		<div class="menu">
			<Menu ref="menu" :active-name="activeMenu.code" :open-names="activeMenu.open" @on-select="tabMenu">
				<MenuItem name="all">全部</MenuItem>
				<Submenu :name="m.uniqid" v-for="(m,i) in menu" :key="i">
					<template slot="title">{{m.name}}</template>
					<MenuItem :name="ticket.id" v-for="(ticket,j) in m.ticket" :key="j">{{ticket.name}}</MenuItem>
				</Submenu>
			</Menu>
		</div>
		<div class="main-form">
			<div class="main-area">
				<Form ref="searchForm" :model="searchForm" :label-width="0" inline v-if="(activeMenu.code=='all')">
					<FormItem>
						<Input type="text" v-model="searchForm.order_sn" placeholder="订单编号" />
					</FormItem>
					<FormItem>
						<DatePicker type="date" v-model="searchForm.date" placeholder="到达日期" />
					</FormItem>
					<FormItem>
						<Input type="text" v-model="searchForm.user" placeholder="联系人/手机号" />
					</FormItem>
					<FormItem>
						<Select v-model="searchForm.state" filterable placeholder="订单状态">
							<Option value="">全部</Option>
							<Option value="0">待支付</Option>
							<Option value="1">支付成功</Option>
							<Option value="2">支付失败</Option>
							<Option value="3">已确认</Option>
							<Option value="4">已取消</Option>
							<Option value="5">退款中</Option>
							<Option value="6">已退款</Option>
							<Option value="7">已完成</Option>
							<Option value="8">已关闭</Option>
						</Select>
					</FormItem>
					<FormItem>
						<Button type="primary" @click="searchOrder">查询</Button>
					</FormItem>
				</Form>
				<Form ref="searchTicketForm" :model="searchTicketForm" :label-width="0" inline v-if="(activeMenu.code!='all')">
					<FormItem>
						<Input type="text" v-model="searchTicketForm.order_sn" placeholder="票务名称" />
					</FormItem>
					<FormItem>
						<Select v-model="searchTicketForm.is_check" filterable placeholder="验票情况">
							<Option value="yes">已使用</Option>
							<Option value="no">未使用</Option>
						</Select>
					</FormItem>
					<FormItem>
						<Select v-model="searchTicketForm.state" filterable placeholder="票务状态">
							<Option value="">全部</Option>
							<Option value="0">无效</Option>
							<Option value="1">正常</Option>
							<Option value="2">已过期</Option>
							<Option value="3">退款中</Option>
							<Option value="4">已退款</Option>
							<Option value="5">已完成</Option>
						</Select>
					</FormItem>
					<FormItem>
						<Button type="primary" @click="searchTicketOrder()">查询</Button>
					</FormItem>
				</Form>
				<Divider dashed />
				<Table border :columns="table.columns" :data="table.data" :loading="table.loading" v-if="(activeMenu.code=='all')">
					<template slot-scope="{ row, index }" slot="action">
						<Button type="primary" size="small" @click="orderTicket(row)">查看票务</Button>
						<Button type="info" size="small" @click="cancelOrder(row,index)" v-if="(row.state==1)">取消订单</Button>
						<Button type="error" size="small" @click="deleteOrder(row,index)" v-if="(row.state!=1)">删除订单</Button>
					</template>
					<tablePage slot="footer" :total="table.page.total" :pageSize="table.page.limit" :page="table.page.page" @jump="loadOrder" @pageSizeJump="loadOrder"></tablePage>
				</Table>
				<orderTicket :data="ticketTypeList.data" @check="checkTicket" :total="ticketTypeList.page.total" :page="ticketTypeList.page.page" :limit="ticketTypeList.page.limit" @jump="loadTicketOrder" @pageSizeJump="loadTicketOrder" @refund="refundTicket" v-if="(activeMenu.code!='all')"></orderTicket>
			</div>
		</div>
		<Modal v-model="modal.open" :title="modal.title" :width="modal.width">
			<orderTicket :data="modal.data" :modal="true" @check="checkTicket" @refund="refundTicket"></orderTicket>
		</Modal>
	</div>
</template>

<script>
	import orderTicket from '../order/components/orderTicket.vue';
	import tablePage from '../../components/tablePage.vue'
	export default {
		name: 'order_list',
		components: {
			orderTicket,
			tablePage
		},
		data() {
			return {
				activeMenu: {
					code: 'all',
					open: []
				},
				menu: [],
				ticketList: {},
				searchForm: {
					order_sn: '',
					user: '',
					state: '',
					date: ''
				},
				searchTicketForm: {
					order_sn: '',
					is_check: '',
					state: ''
				},
				table: {
					loading: true,
					page: {
						page: 1,
						limit: 10,
						total: 0
					},
					data: [],
					columns: [{
						"type": "expand",
						"width": 50,
						render: (h, params) => {
							var that = this;
							return h(orderTicket, {
								props: {
									data: params.row.body
								},
								on: {
									checkTicket(row, index) {
										that.checkTicket(row, index);
									},
									refundTicket(row, index) {
										that.refundTicket(row, index);
									}
								}
							})
						}
					}, {
						"title": "订单编号",
						"key": "order_sn",
						"sortable": true,
						"width": 264
					}, {
						"title": "购买数量",
						"key": "count",
						"sortable": true,
						"width": 104,
						"align": "center"
					}, {
						"title": "验票数量",
						"key": "check",
						"sortable": true,
						"width": 104,
						"align": "center"
					}, {
						"title": "到达时间",
						"key": "date",
						"sortable": true,
						"width": 104,
						"align": "center"
					}, {
						"title": "联系人",
						"key": "contact",
						"sortable": true,
						"width": 92,
					}, {
						"title": "手机号码",
						"key": "mobile",
						"sortable": true,
						"width": 116,
					}, {
						"title": "备注",
						"key": "note"
					}, {
						"title": "下单时间",
						"key": "add_time",
						"sortable": true,
						"width": 152
					}, {
						"title": "订单状态",
						"key": "status",
						"sortable": true,
						"width": 104
					}, {
						"width": 100,
						"slot": "action"
					}]
				},
				modal: {
					open: false,
					title: '票务信息',
					width: '1240',
					data: []
				},
				ticketTypeList: {
					data: [],
					loading: true,
					page: {
						page: 1,
						limit: 10,
						total: 0
					},
				}
			}
		},
		created() {

		},
		mounted() {
			this.$store.dispatch('getTicketTypeTicket').then((result) => {
				this.menu = result;
				var open = new Array();
				result.find((item) => {
					open.push(item.uniqid);
				})
				this.activeMenu.open = open;
				this.$nextTick(function() {
					this.$refs.menu.updateOpened();
					this.$refs.menu.updateActiveName();
				})
			})
			this.getOrder();
		},
		methods: {
			tabMenu(name) {
				var that = this;
				that.activeMenu.code = name;
				if (name != 'all') {
					that.getOrderTicket()
				} else {
					that.getOrder(that.table.page);
				}
			},
			orderTicket(row) {
				this.modal.open = true;
				this.modal.data = row.body
			},
			getOrderTicket(params) {
				var data = Object.assign(this.ticketTypeList.page, {
					ticket_id: this.activeMenu.code
				}, params);
				this.$store.dispatch('getOrderTicket', data).then((result) => {
					this.ticketTypeList.data = result.data;
					this.ticketTypeList.page.total = result.total;
				})
			},
			loadTicketOrder(page) {
				this.ticketTypeList.page.page = page.pageNumber;
				if (page.pageSize != undefined) {
					this.ticketTypeList.page.limit = page.pageSize;
				}
				this.ticketTypeList.loading = true;
				this.getOrderTicket()
			},
			searchTicketOrder() {
				this.table.page.page = 1;
				this.getOrderTicket(this.searchTicketForm);
			},
			getOrder(params) {
				var data = Object.assign(this.table.page, params);
				this.$store.dispatch('getOrderList', data).then((result) => {
					this.table.data = result.data;
					this.table.page.total = result.total;
					this.$nextTick(function() {
						this.table.loading = false;
					})
				})
			},
			loadOrder(page) {
				this.table.page.page = page.pageNumber;
				if (page.pageSize != undefined) {
					this.table.page.limit = page.pageSize;
				}
				this.table.loading = true;
				this.getOrder()
			},
			searchOrder() {
				this.table.page.page = 1;
				this.getOrder(this.searchForm);
			},
			cancelOrder(row, index) {
				var that = this;
				that.$Modal.confirm({
					title: '提示',
					content: '确认要取消该订单吗？',
					onOk: function() {
						that.$store.dispatch('cancelOrder', {
							order_sn: row.order_sn
						}).then((result) => {
							that.$Message.info('取消成功');
							that.table.data[index].status = '已取消';
							that.table.data[index].state = result.state;
						})
					}
				})
			},
			deleteOrder(row, index) {
				var that = this;
				that.$Modal.confirm({
					title: '提示',
					content: '确认要删除该订单吗？此操作无法恢复',
					onOk: function() {
						that.$store.dispatch('removeOrder', {
							order_sn: row.order_sn
						}).then(() => {
							that.$Message.info('删除成功');
							that.table.data.splice(index, 1);
						})
					}
				})
			},
			checkTicket(row) {
				var that = this;
				that.$Modal.confirm({
					title: '提示',
					content: '确认要验票吗？此操作无法恢复',
					onOk: function() {
						that.$store.dispatch('CheckOrderTicket', {
							uniqid: row.uniqid
						}).then(() => {
							that.$Message.info('使用成功');
						})
					}
				})
			},
			refundTicket(row) {
				var that = this;
				that.$Modal.confirm({
					title: '提示',
					content: '确认要取消吗？此操作无法恢复',
					onOk: function() {
						that.$store.dispatch('RefundOrderTicket', {
							uniqid: row.uniqid
						}).then(() => {
							that.$Message.info('取消成功');
						})
					}
				})
			}
		}
	}
</script>

<style>
	.order_list_page {
		height: 100%;
		position: relative;
	}

	.order_list_page .menu {
		position: absolute;
		height: 100%;
		left: 0px;
		top: 0px;
	}

	.order_list_page .menu ul {
		height: 100%;
	}

	.order_list_page .main-form {
		padding-left: 240px;
		height: 100%;
		width: 100%;
		overflow: hidden;
		box-sizing: border-box;
	}

	.order_list_page .main-area {
		width: calc(100% + 17px);
		width: -moz-calc(100% + 17px);
		width: -webkit-calc(100% + 17px);
		height: 100%;
		padding: 10px;
		overflow-y: scroll;
		box-sizing: border-box;
		border: 1px solid #F0F0F0;
	}

	.ivu-form-inline .ivu-form-item {
		margin-bottom: 0px;
	}
</style>

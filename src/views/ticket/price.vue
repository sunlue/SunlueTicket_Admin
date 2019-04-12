<template>
	<div class="page ticket_price_page">
		<div class="menu">
			<Menu ref="menu" :active-name="activeMenu.code" :open-names="activeMenu.open" @on-select="tabMenu">
				<Submenu :name="m.uniqid" v-for="(m,i) in menu" :key="i">
					<template slot="title">{{m.name}}</template>
					<MenuItem :name="ticket.id" v-for="(ticket,j) in m.ticket" :key="j">{{ticket.name}}</MenuItem>
				</Submenu>
			</Menu>
		</div>
		<div class="main-form">
			<div class="main-area">
				<full-calendar ref="calendar" :config="calendarSetting.config" :events="calendarSetting.events" />
				<Modal v-model="calendarModal.open" :title="calendarModal.title">
					<Form ref="calendarForm" :label-width="60" :model="calendarForm">
						<FormItem label="日期">
							<DatePicker type="date" placeholder="日期" v-model="calendarForm.date" style="width: 100%;"></DatePicker>
						</FormItem>
						<FormItem label="原价">
							<InputNumber v-model='calendarForm.original' disabled></InputNumber>
							<span>元，售价</span>
							<InputNumber v-model='calendarForm.present' disabled></InputNumber>
							<span>元</span>
						</FormItem>
						<FormItem label="动态价">
							<span>成本</span>
							<InputNumber v-model='calendarForm.cost' :precision="2" :min="0"></InputNumber>
							<span>+利润</span>
							<InputNumber v-model='calendarForm.profit' :precision="2" :min="0"></InputNumber>
							<span>售价：{{calendarForm.cost+calendarForm.profit}}元</span>
						</FormItem>
						<FormItem label="库存">
							<span>共</span>
							<InputNumber v-model='calendarForm.number' :min="0" />
							<span>张，已售</span>
							<InputNumber v-model='calendarForm.sales' readonly />
							<span>张，余{{calendarForm.number-calendarForm.sales}}张</span>
						</FormItem>
						<FormItem label="价格描述">
							<Input placeholder="价格调整描述" type="textarea" v-model="calendarForm.remark"></Input>
						</FormItem>
					</Form>
					<p slot="footer">
						<Button type="info" @click="handModalOk">确定</Button>
					</p>
				</Modal>
			</div>
		</div>
	</div>
</template>

<script>
	import 'fullcalendar/dist/locale/zh-cn'
	export default {
		name: 'ticket_price',
		data() {
			var that = this;
			return {
				activeMenu: {
					code: '',
					open: []
				},
				calendarSetting: {
					date: {
						start: '',
						end: ''
					},
					config: {
						defaultView: 'month',
						header: {
							left: 'prev,next today',
							center: 'title',
							right: 'month,listMonth'
						},
						aspectRatio:1.8,
						locale: 'zh-cn',
						buttonText: {
							prev: '上月',
							next: '下月',
							month: '月',
							listMonth: '列表'
						},
						dayClick: function(date, jsEvent, view) {
							that.clickCalendarDay(date.format())
						},
						eventClick: function(event, jsEvent, view) {
							that.clickCalendarDay(event.start.format())
						}
					},
					events: function(start, end, time, callback) {
						if (that.activeMenu.code == '') {
							that.tickets(function() {
								that.tickePrice({
									start: start.format(),
									end: end.format(),
									ticket: that.activeMenu.code
								}, function(events) {
									callback(events);
								});
							});
						} else {
							that.tickePrice({
								start: start.format(),
								end: end.format(),
								ticket: that.activeMenu.code
							}, function(events) {
								callback(events);
							});
						}
					}
				},
				menu: [],
				ticketList: {},
				ticketDetails: {},
				ticketPrice: {},
				calendarModal: {
					open: false,
					title: '20190306'
				},
				calendarForm: {},
			}
		},
		mounted() {},
		created() {
			var that = this,
				ticket = this.$route.params.ticket;
				if (ticket!=undefined) {
					that.activeMenu.code=ticket['id']
					that.tickets(function(){
						that.activeMenu.code=ticket['id']
						that.$nextTick(function() {
							that.$refs.menu.updateOpened();
							that.$refs.menu.updateActiveName();
						})
					})
				} 
		},
		methods: {
			tabMenu(name) {
				this.activeMenu.code = name;
				this.$refs.calendar.fireMethod('refetchEvents');
			},
			tickets(callback) {
				var that = this;
				this.$store.dispatch('getTicketTypeTicket', {}).then((result) => {
					that.menu = result;
					var open = new Array();
					result.find((item) => {
						open.push(item.uniqid);
						if (that.activeMenu.code == '' && item['ticket'][0] != undefined) {
							that.activeMenu.code = item['ticket'][0]['id'];
						}
						item.ticket.find((t) => {
							that.ticketList[t.id] = t;
						})
					})
					that.activeMenu.open = open;
					that.activeMenu.name = result[0]['name'];
					that.$nextTick(function() {
						that.$refs.menu.updateOpened();
						that.$refs.menu.updateActiveName();
					})
					typeof(callback) == 'function' ? callback(): '';
				})
			},
			clickCalendarDay: function(date) {
				var dateFormat = date.split('-');
				var year = dateFormat[0];
				var month = dateFormat[1];
				var day = dateFormat[2];
				this.calendarModal.open = true;
				this.calendarModal.title = year + '年' + month + '月' + day + '日';

				var calendarForm = {
					date: date
				};
				if (this.ticketPrice[date] == undefined) {
					calendarForm['original'] = parseFloat(this.ticketDetails.original);
					calendarForm['present'] = parseFloat(this.ticketDetails.present);
					calendarForm['cost'] = 0.00;
					calendarForm['profit'] = 0.00;
					calendarForm['number'] = 0;
					calendarForm['sales'] = 0;
					calendarForm['remark'] = '';
				} else {
					var ticket_price = this.ticketPrice[date];
					calendarForm['original'] = parseFloat(this.ticketDetails.original);
					calendarForm['present'] = parseFloat(this.ticketDetails.present);
					calendarForm['cost'] = parseFloat(ticket_price.cost);
					calendarForm['profit'] = parseFloat(ticket_price.profit);
					calendarForm['number'] = ticket_price.number;
					calendarForm['sales'] = ticket_price.sales;
					calendarForm['remark'] = ticket_price.remark;
				}
				this.calendarForm = calendarForm;
			},
			tickePrice(data, callback) {
				var that = this;
				this.$store.dispatch('getTicketListPrice', data).then((result) => {
					that.ticketDetails = result.ticket;
					var events = new Array();
					var sdate = new Date(data.start.replace(/-/g, "/"));
					var edate = new Date(data.end.replace(/-/g, "/"));
					var day = parseInt(edate.getTime() - sdate.getTime()) / (1000 * 60 * 60 * 24);
					for (var i = 0; i < day; i++) {
						var dateTime = sdate.getTime() + 24 * 60 * 60 * 1000 * i;
						var date = new Date(dateTime);
						var y = date.getFullYear();
						var m = date.getMonth() + 1;
						var d = date.getDate();
						var start = y + '-' + (m < 10 ? '0' : '') + m + '-' + (d < 10 ? '0' : '') + d
						events.push({
							title: '原价:' + result.ticket.original + '元,售价:' + result.ticket.present + '元',
							start: start,
							allDay: true,
							className: 'calendarTd',
							color: '#515a6e',
							textColor: '#fff'
						});
					}
					result.price.find((item) => {
						events.push({
							title: '库存：' + (item['number']) + '张',
							start: item.date,
							allDay: true,
							className: 'calendarTd',
							color: (item.number < 10 ? (item.number < 5 ? '#ed4014' : '#ff9900') : '#19be6b'),
							textColor: '#fff'
						});
						events.push({
							title: '动态价：' + (parseFloat(item['cost']) + parseFloat(item['profit'])) + '元',
							start: item.date,
							allDay: true,
							className: 'calendarTd',
							color: '#2d8cf0',
							textColor: '#fff'
						});
						that.ticketPrice[item.date] = item;
					})
					typeof(callback) == 'function' ? callback(events): '';
				})
			},
			handModalOk() {
				var that = this,
					data = this.calendarForm;
				data.ticket = this.activeMenu.code;
				this.$store.dispatch('setTicketPrice', data).then((result) => {
					that.$refs.calendar.fireMethod('refetchEvents');
					that.$refs.calendarForm.resetFields;
					that.calendarModal.open = false;
				})
			}
		}
	}
</script>

<style>
	.ticket_price_page {
		height: 100%;
		position: relative;
	}

	.ticket_price_page .menu {
		position: absolute;
		height: 100%;
		left: 0px;
		top: 0px;
	}

	.ticket_price_page .menu ul {
		height: 100%;
	}

	.ticket_price_page .main-form {
		padding-left: 240px;
		height: 100%;
		width: 100%;
		overflow: hidden;
		box-sizing: border-box;
	}

	.ticket_price_page .main-area {
		width: calc(100% + 17px);
		width: -moz-calc(100% + 17px);
		width: -webkit-calc(100% + 17px);
		height: 100%;
		padding: 10px;
		overflow-y: scroll;
		box-sizing: border-box;
		border: 1px solid #F0F0F0;
	}

	.calendarTd {
		padding: 5px 5px;
	}
</style>

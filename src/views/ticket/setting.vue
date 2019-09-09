<template>
	<div class="page ticket_setting_page">
		<div class="menu scroll-y">
			<Menu :active-name="activeMenu" :open-names="['default']" @on-select="menu">
				<Submenu name="default">
					<template slot="title">票务设置</template>
					<MenuItem name="type">票务类型</MenuItem>
					<MenuItem name="know">购买须知</MenuItem>
				</Submenu>
			</Menu>
		</div>
		<div class="main-form">
			<div class="main-area scroll-y">
				<div v-show="(activeMenu=='type')">
					<Row>
						<Col :xs="{span:16}" :sm="{span:12}" :lg="{span:8}">
						<Form ref="tickeTypeForm" :model="tickeType.form" :label-width="80">
							<FormItem v-for="(item, index) in tickeType.form.fields" :key="index" :prop="'fields.' + index + '.name'" :rules="{required: true, message: '此项不能为空', trigger: 'blur'}">
								<Row>
									<Col span="14">
									<Input type="text" v-model="item.name">
										<span slot="append">
											<Tooltip content="保存" placement="bottom">
												<Icon class="iconfont icon-save" @click="tickeTypeFormSave(item,index)" />
											</Tooltip>
										</span>
									</Input>
									</Col>
									<Col span="4" offset="1" class="text-center">
									<i-switch v-model="item.enable" size="large" true-value="yes" false-value="no" @on-change="tickeTypeFormEnable(item,index)">
										<span slot="open">启用</span>
										<span slot="close">禁用</span>
									</i-switch>
									</Col>
									<Col span="4" offset="1">
									<Button type="error" size="small" @click="tickeTypeFormRemove(item,index)">删除</Button>
									</Col>
								</Row>
							</FormItem>
							<FormItem>
								<Button type="dashed" @click="tickeTypeFormAdd()" icon="md-add">添加类型</Button>
							</FormItem>
						</Form>
						</Col>
					</Row>
				</div>
				<div v-show="(activeMenu=='know')">
					<div class="search">
						<Form ref="tickeKnowSearchForm" :model="tickeKnow.search.form.fields" :label-width="0" inline>
							<FormItem>
								<Row>
									<Col span="24" v-if="(tickeKnow.search.form.fields.book_type>1)" style="width: 200px;">
									<Col span="12" style="width: 80px;">
									<Select v-model="tickeKnow.search.form.fields.book_type">
										<Option value=""></Option>
										<Option value="1">仅限当天预订</Option>
										<Option value="2">需提前</Option>
										<Option value="3">可提前</Option>
									</Select>
									</Col>
									<Col span="12" style="width: 120px;">
									<Input v-model="tickeKnow.search.form.fields.book_day">
									<div slot="append">天预订</div>
									</Input>
									</Col>
									</Col>
									<Col span="24" v-if="(tickeKnow.search.form.fields.book_type<=1)">
									<Select v-model="tickeKnow.search.form.fields.book_type">
										<Option value=""></Option>
										<Option value="1">仅限当天预订</Option>
										<Option value="2">需提前</Option>
										<Option value="3">可提前</Option>
									</Select>
									</Col>
								</Row>
							</FormItem>
							<FormItem>
								<Row>
									<Col span="24" v-if="(tickeKnow.search.form.fields.aging_type>1)" style="width: 200px;">
									<Col span="12" style="width: 80px;">
									<Select v-model="tickeKnow.search.form.fields.aging_type">
										<Option value=""></Option>
										<Option value="1">仅限当天使用</Option>
										<Option value="2">可提前</Option>
										<Option value="3">可延后</Option>
									</Select>
									</Col>
									<Col span="12" style="width: 120px;">
									<Input v-model="tickeKnow.search.form.fields.aging_day">
									<div slot="append">天使用</div>
									</Input>
									</Col>
									</Col>
									<Col span="24" v-if="(tickeKnow.search.form.fields.aging_type<=1)">
									<Select v-model="tickeKnow.search.form.fields.aging_type">
										<Option value=""></Option>
										<Option value="1">仅限当天使用</Option>
										<Option value="2">可提前</Option>
										<Option value="3">可延后</Option>
									</Select>
									</Col>
								</Row>
							</FormItem>
							<FormItem>
								<TimePicker type="time" placeholder="入园时间" v-model="tickeKnow.search.form.fields.start_time" />
							</FormItem>
							<FormItem>
								<TimePicker type="time" placeholder="闭园时间" v-model="tickeKnow.search.form.fields.end_time" />
							</FormItem>
							<FormItem>
								<ButtonGroup>
									<Button type="primary" @click="tickeKnowFormSearch()">查询</Button>
									<Button @click="handleReset('tickeKnowSearchForm')">重置</Button>
								</ButtonGroup>
							</FormItem>
						</Form>
					</div>

					<Divider dashed />

					<Table border :columns="tickeKnow.table.columns" :data="tickeKnow.table.data" :loading="tickeKnow.table.loading">
						<div slot="header" style="padding: 0px 10px;">
							<Button type="primary" @click="tickeKnowFormAdd">添加</Button>
						</div>
						<template slot-scope="{ row, index }" slot="action">
							<Button type="primary" size="small" @click="tickeKnowFormEdit(row)">修改</Button>
							<Button type="error" size="small" @click="tickeKnowFormRemove(row,index)">删除</Button>
						</template>
						<tablePage slot="footer" :total="tickeKnow.table.paging.total" :pageSize="tickeKnow.table.paging.limit" :page="tickeKnow.table.paging.page"
						 @jump="tickeKnowFormLoad" @pageSizeJump="tickeKnowFormLoad"></tablePage>
					</Table>

					<Modal v-model="tickeKnow.table.modal.show" :draggable="false" :footer-hide="true" :title="tickeKnow.table.modal.title">
						<div v-html="tickeKnow.table.modal.content"></div>
					</Modal>

					<Modal v-model="tickeKnow.modal.show" :width="tickeKnow.modal.width" :footer-hide="true" :title='tickeKnow.modal.title'>
						<Form ref="tickeKnowForm" :model="tickeKnow.form.fields" :rules="tickeKnow.form.rules" :label-width="80">
							<Tabs value="book">
								<TabPane label="预订说明" name="book">
									<Row>
										<Col span="12">
										<FormItem label="预订时间">
											<RadioGroup v-model="tickeKnow.form.fields.book_type">
												<Radio :label="1">
													<span>仅限当天预订</span>
												</Radio>
												<Radio :label="2">
													<span>需提前</span>
													<InputNumber size="small" :min="0" v-if="tickeKnow.form.fields.book_type=='2'" v-model='tickeKnow.form.fields.book_day' />
													<span v-if="tickeKnow.form.fields.book_type=='2'">天</span>
													<span>预订</span>
												</Radio>
												<Radio :label="3">
													<span>可提前</span>
													<InputNumber size="small" :min="0" v-if="tickeKnow.form.fields.book_type=='3'" v-model='tickeKnow.form.fields.book_day' />
													<span v-if="tickeKnow.form.fields.book_type=='3'">天</span>
													<span>预订</span>
												</Radio>
											</RadioGroup>
										</FormItem>
										<FormItem label="有效期">
											<RadioGroup v-model="tickeKnow.form.fields.aging_type">
												<Radio :label="1">
													<span>仅限当天时间</span>
												</Radio>
												<Radio :label="2">
													<span>可提前</span>
													<InputNumber size="small" :min="0" v-if="tickeKnow.form.fields.aging_type=='2'" v-model='tickeKnow.form.fields.aging_day' />
													<span v-if="tickeKnow.form.fields.aging_type=='2'">天</span>
													<span>使用</span>
												</Radio>
												<Radio :label="3">
													<span>可延后</span>
													<InputNumber size="small" :min="0" v-if="tickeKnow.form.fields.aging_type=='3'" v-model='tickeKnow.form.fields.aging_day' />
													<span v-if="tickeKnow.form.fields.aging_type=='3'">天</span>
													<span>使用</span>
												</Radio>
											</RadioGroup>
										</FormItem>
										<FormItem label="适用条件" prop="apply">
											<Input type="textarea" v-model="tickeKnow.form.fields.apply"></Input>
										</FormItem>
										<FormItem label="限购政策" prop="limit">
											<Input type="textarea" v-model="tickeKnow.form.fields.limit"></Input>
										</FormItem>
										</Col>
									</Row>
								</TabPane>
								<TabPane label="费用说明" name="money">
									<FormItem :label-width="0">
										<Tinymce ref="fee" v-model="tickeKnow.form.fields.fee" />
									</FormItem>
								</TabPane>
								<TabPane label="使用说明" name="use">
									<Row>
										<Col span="12">
										<FormItem label="使用时间">
											<TimePicker type="time" placeholder="入园时间" v-model="tickeKnow.form.fields.start_time"></TimePicker>
											<span>&nbsp;&nbsp;至&nbsp;&nbsp;</span>
											<TimePicker type="time" placeholder="闭园时间" v-model="tickeKnow.form.fields.end_time"></TimePicker>
										</FormItem>
										<FormItem label="使用方法">
											<Input type="textarea" v-model="tickeKnow.form.fields.use_method"></Input>
										</FormItem>
										<FormItem label="入园地址">
											<Input type="text" v-model="tickeKnow.form.fields.address"></Input>
										</FormItem>
										<FormItem label="补充说明">
											<Input type="textarea" v-model="tickeKnow.form.fields.details"></Input>
										</FormItem>
										</Col>
									</Row>
								</TabPane>
								<TabPane label="退改说明" name="refund">
									<FormItem :label-width="0">
										<Tinymce ref="refund" v-model="tickeKnow.form.fields.refund" />
									</FormItem>
								</TabPane>
								<TabPane label="发票说明" name="invoice">
									<FormItem :label-width="0">
										<Tinymce ref="invoice" v-model="tickeKnow.form.fields.invoice" />
									</FormItem>
								</TabPane>
								<div slot="extra">
									<ButtonGroup>
										<Button type="primary" v-if="tickeKnow.modal.type=='add'" size="small" @click="tickeKnowFormSubmit()">提交</Button>
										<Button type="primary" v-if="tickeKnow.modal.type=='edit'" size="small" @click="tickeKnowFormSave()">保存</Button>
										<Button type="default" size="small" @click="handleReset('tickeKnowForm')">重置</Button>
									</ButtonGroup>
								</div>
							</Tabs>
						</Form>
					</Modal>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
	import Tinymce from '@/components/Tinymce'
	import tablePage from '@/components/tablePage'
	export default {
		name: 'ticket_setting',
		data() {
			return {
				activeMenu: 'type',
				tickeType: {
					form: {
						fields: []
					},
				},
				tickeKnow: {
					search: {
						form: {
							fields: {
								book_type: '',
								book_day: '',
								aging_type: '',
								aging_day: '',
								start_time: '',
								end_time: ''
							}
						}
					},
					modal: {
						show: false,
						width: 1000,
						type: 'add',
						title: '添加票务须知',
						uniqid: ''
					},
					table: {
						loading: true,
						modal: {
							title: '',
							show: false,
							content: ''
						},
						paging: {
							page: 1,
							limit: 10,
							total: 0
						},
						data: [],
						columns: [{
							title: '标识',
							align: 'center',
							key: 'uniqid',
						}, {
							title: '预订说明',
							align: 'center',
							children: [{
								title: '预订时间',
								render: (h, params) => {
									var text = '仅限当天预订';
									if (params.row.book_type == 2) {
										text = '需提前' + params.row.book_day + '天预订';
									} else if (params.row.book_type == 3) {
										text = '可提前' + params.row.book_day + '预订';
									}
									return h('div', {}, text);
								}
							}, {
								title: '使用时间',
								render: (h, params) => {
									var text = '仅限当天使用';
									if (params.row.aging_type == 2) {
										text = '可提前' + params.row.aging_day + '天使用';
									} else if (params.row.aging_type == 3) {
										text = '可延后' + params.row.aging_day + '天使用';
									}
									return h('div', {}, text);
								}
							}, {
								title: '适用条件',
								width: 86,
								align: 'center',
								render: (h, params) => {
									if (!params.row.apply) {
										return h('span', {}, '暂无数据');
									}
									var that = this;
									return h('Button', {
										props: {
											type: 'info',
											size: 'small'
										},
										on: {
											click: () => {
												that.tickeKnow.table.modal.title = '查看适用条件';
												that.tickeKnow.table.modal.content = params.row.apply;
												that.tickeKnow.table.modal.show = true;
											}
										}
									}, '查看')
								}
							}, {
								title: '限购政策',
								width: 86,
								align: 'center',
								render: (h, params) => {
									if (!params.row.limit) {
										return h('span', {}, '暂无数据');
									}
									var that = this;
									return h('Button', {
										props: {
											type: 'info',
											size: 'small'
										},
										on: {
											click: () => {
												that.tickeKnow.table.modal.title = '查看限购政策';
												that.tickeKnow.table.modal.content = params.row.limit;
												that.tickeKnow.table.modal.show = true;
											}
										}
									}, '查看')
								}
							}]
						}, {
							title: '费用包含',
							width: 86,
							align: 'center',
							render: (h, params) => {
								if (!params.row.fee) {
									return h('span', {}, '暂无数据');
								}
								var that = this;
								return h('Button', {
									props: {
										type: 'info',
										size: 'small'
									},
									on: {
										click: () => {
											that.tickeKnow.table.modal.title = '查看费用包含';
											that.tickeKnow.table.modal.content = params.row.fee;
											that.tickeKnow.table.modal.show = true;
										}
									}
								}, '查看')
							}
						}, {
							title: '使用说明',
							align: 'center',
							children: [{
								title: '使用方法',
								width: 86,
								align: 'center',
								render: (h, params) => {
									if (!params.row.use_method) {
										return h('span', {}, '暂无数据');
									}
									var that = this;
									return h('Button', {
										props: {
											type: 'info',
											size: 'small'
										},
										on: {
											click: () => {
												that.tickeKnow.table.modal.title = '查看使用方法';
												that.tickeKnow.table.modal.content = params.row.use_method;
												that.tickeKnow.table.modal.show = true;
											}
										}
									}, '查看')
								}
							}, {
								title: '入园地址',
								key: 'address',
							}, {
								title: '补充说明',
								width: 86,
								align: 'center',
								render: (h, params) => {
									if (!params.row.details) {
										return h('span', {}, '暂无数据');
									}
									return h('Button', {
										props: {
											type: 'info',
											size: 'small'
										},
										on: {
											click: () => {
												that.tickeKnow.table.modal.title = '查看补充说明';
												that.tickeKnow.table.modal.content = params.row.details;
												that.tickeKnow.table.modal.show = true;
											}
										}
									}, '查看')
								}
							}]
						}, {
							title: '入园时间',
							align: 'center',
							children: [{
								title: '开始时间',
								key: 'start_time',
								width: 86,
							}, {
								title: '结束时间',
								key: 'end_time',
								width: 86,
							}],
						}, {
							title: '退改说明',
							width: 86,
							align: 'center',
							render: (h, params) => {
								if (!params.row.refund) {
									return h('span', {}, '暂无数据');
								}
								var that = this;
								return h('Button', {
									props: {
										type: 'info',
										size: 'small'
									},
									on: {
										click: () => {
											that.tickeKnow.table.modal.title = '查看退改说明';
											that.tickeKnow.table.modal.content = params.row.refund;
											that.tickeKnow.table.modal.show = true;
										}
									}
								}, '查看')
							}
						}, {
							title: '发票说明',
							width: 86,
							align: 'center',
							render: (h, params) => {
								if (!params.row.invoice) {
									return h('span', {}, '暂无数据');
								}
								var that = this;
								return h('Button', {
									props: {
										type: 'info',
										size: 'small'
									},
									on: {
										click: () => {
											that.tickeKnow.table.modal.title = '查看发票说明';
											that.tickeKnow.table.modal.content = params.row.invoice;
											that.tickeKnow.table.modal.show = true;
										}
									}
								}, '查看')
							}
						}, {
							title: '其他说明',
							width: 86,
							align: 'center',
							render: (h, params) => {
								if (!params.row.other) {
									return h('span', {}, '暂无数据');
								}
								var that = this;
								return h('Button', {
									props: {
										type: 'info',
										size: 'small'
									},
									on: {
										click: () => {
											that.tickeKnow.table.modal.title = '查看其他';
											that.tickeKnow.table.modal.content = params.row.other;
											that.tickeKnow.table.modal.show = true;
										}
									}
								}, '查看')
							}
						}, {
							width: 76,
							align: 'center',
							title: '操作',
							slot: 'action'
						}]
					},
					form: {
						fields: {
							book_type: 1,
							book_day: 3,
							aging_type: 1,
							aging_day: 3,
							apply: '',
							limit: '',
							fee: '',
							use_method: '',
							address: '',
							start_time: '08:00:00',
							end_time: '18:00:00',
							details: '',
							refund: '',
							invoice: '',
						},
						rules: {}
					}
				}
			}
		},
		components: {
			Tinymce,
			tablePage
		},
		mounted() {
			this.$store.dispatch('getTicketType').then((result) => {
				for (var i = 0; i < result.length; i++) {
					result[i]['edit'] = true
					result[i]['save'] = false
				}
				this.tickeType.form.fields = result;
			})
			this.getTicketKonw()
		},
		methods: {
			menu: function(menuName) {
				this.activeMenu = menuName;
			},
			handleReset(name) {
				this.$refs[name].resetFields();
			},
			tickeTypeFormAdd() {
				this.tickeType.form.fields.push({
					name: '',
					enable: 'yes'
				});
			},
			tickeTypeFormSave(item) {
				this.$store.dispatch('setTicketType', item).then(() => {
					this.$Message.success('提交成功');
				})
			},
			tickeTypeFormEnable(item) {
				this.$store.dispatch('enableTicketType', {
					uniqid: item.uniqid,
					enable: item.enable
				}).then(() => {
					var enable = item.enable == 'yes' ? '启用' : '禁用';
					this.$Message.success(enable + '成功');
				})
			},
			tickeTypeFormRemove(item, index) {
				var that = this;
				if (item.uniqid == undefined) {
					that.tickeType.form.fields.splice(index);
					return false;
				}
				that.$Modal.confirm({
					title: '提示',
					content: '确定要删除<' + item['name'] + '>吗?',
					onOk: function() {
						that.$store.dispatch('removeTicketType', item).then(() => {
							that.tickeType.form.fields.splice(index)
							that.$Message.success('提交成功');
						})
					}
				})
			},
			getTicketKonw(param) {
				var params = Object.assign(this.tickeKnow.table.paging, param);
				this.$store.dispatch('getTicketKnow', params).then((result) => {
					this.tickeKnow.table.data = result.data;
					this.tickeKnow.table.paging.total = result.total;
					this.tickeKnow.table.loading = false;
				})
			},
			tickeKnowFormAdd() {
				this.tickeKnow.modal.show = true;
				this.tickeKnow.modal.type = 'add';
				this.tickeKnow.modal.title = '添加票务须知';
				this.tickeKnow.modal.uniqid = '';
				this.$refs['tickeKnowForm'].resetFields();
				this.$refs.fee.setContent('');
				this.$refs.refund.setContent('');
				this.$refs.invoice.setContent('');
			},
			tickeKnowFormSubmit() {
				var formParams = this.tickeKnow.form.fields;
				this.$refs['tickeKnowForm'].validate((valid) => {
					if (valid) {
						this.$store.dispatch('setTicketKnow', formParams).then((result) => {
							this.tickeKnow.table.data.push(result)
							this.$Message.success('提交成功');
							this.tickeKnow.modal.show = false;
						})
					} else {
						this.$Message.error('Fail!');
					}
				})
			},
			tickeKnowFormSearch() {
				var params = this.tickeKnow.search.form.fields;
				this.tickeKnow.table.loading = true;
				this.getTicketKonw(params);
			},
			tickeKnowFormLoad(page) {
				this.tickeKnow.table.paging.page = page.pageNumber;
				if (page.pageSize != undefined) {
					this.tickeKnow.table.paging.limit = page.pageSize;
				}
				this.tickeKnow.table.loading = true;
				this.getTicketKonw()
			},
			tickeKnowFormEdit(row) {
				this.tickeKnow.form.fields = row;
				this.tickeKnow.modal.show = true;
				this.tickeKnow.modal.type = 'edit';
				this.tickeKnow.modal.title = '修改票务须知';
				this.tickeKnow.modal.uniqid = row.uniqid;
				this.$refs.fee.setContent(row.fee);
				this.$refs.refund.setContent(row.refund);
				this.$refs.invoice.setContent(row.invoice);
			},
			tickeKnowFormSave() {
				var formParams = this.tickeKnow.form.fields;
				formParams['uniqid'] = this.tickeKnow.modal.uniqid
				this.$refs['tickeKnowForm'].validate((valid) => {
					if (valid) {
						this.$store.dispatch('editTicketKnow', formParams).then(() => {
							this.$Message.success('保存成功');
							this.tickeKnow.modal.show = false;
						})
					} else {
						this.$Message.error('Fail!');
					}
				})
			},
			tickeKnowFormRemove(row, index) {
				var that = this;
				this.$Modal.confirm({
					title: '提示',
					content: '确认要删除吗？此操作无法恢复',
					onOk: function() {
						that.$store.dispatch('removeTicketKnow', {
							uniqid: row.uniqid
						}).then(() => {
							that.$Message.success('删除成功');
							that.tickeKnow.table.data.splice(index, 1);
						})
					}
				})
			}
		}
	}
</script>

<style lang="less">
	.ticket_setting_page {
		height: 100%;
		padding: 0px;
		position: relative;
		.scroll-y{
			position: absolute;
		}
	}

	.menu {
		position: absolute;
		height: 100%;
		left: 0px;
		top: 0px;
	}

	.menu ul {
		height: 100%;
	}

	.main-form {
		padding-left: 240px;
		height: 100%;
		width: 100%;
		overflow: hidden;
		box-sizing: border-box;
	}

	.main-area {
		width: calc(100% - 240px);
		position: absolute;
		height: 100%;
		padding: 10px;
		box-sizing: border-box;
	}

	.ivu-form-inline .ivu-form-item {
		margin-bottom: 0px;
	}
</style>

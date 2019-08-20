<template>
	<div class="page ticket_list_page">
		<div class="menu scroll-y">
			<Menu ref="menu" :active-name="activeMenu.uniqid" :open-names="['default']" @on-select="tabMenu">
				<Submenu name="default">
					<template slot="title">票务类型</template>
					<MenuItem :name="item.uniqid" v-for="(item,index) in menu" :key="index">{{item.name}}</MenuItem>
				</Submenu>
			</Menu>
		</div>
		<div class="main-form">
			<div class="main-area scroll-y">
				<div class="ticket_item" v-if="activeMenu.uniqid">
					<Row>
						<Col span="4">
						<ButtonGroup>
							<Button type="primary" @click="(addModal=true)">添加</Button>
						</ButtonGroup>
						</Col>
						<Col span="20" class="text-right">
						<Form ref="searchForm" inline>
							<FormItem style="margin-bottom: 0px;">
								<Input type="text" v-model="searchForm.name" placeholder="票务名称" />
							</FormItem>
							<FormItem style="margin-bottom: 0px;">
								<RadioGroup v-model="searchForm.shelves">
									<Radio label="yes">上架</Radio>
									<Radio label="no">下架</Radio>
								</RadioGroup>
								<Checkbox v-model="searchForm.recom">推荐</Checkbox>
								<Checkbox v-model="searchForm.top">置顶</Checkbox>
								<Checkbox v-model="searchForm.hot">热门</Checkbox>
							</FormItem>
							<FormItem style="margin-bottom: 0px;">
								<Button type="primary" @click="handleSearch">查询</Button>
							</FormItem>
						</Form>
						</Col>
					</Row>
					<Divider dashed />
					<Row class="row" v-if="itemList.length>0">
						<Col :lg="{span:6}" :md="{span:12}" :sm="{span:18}" class="col" v-for="(item,index) in itemList" :key="index">
						<div class="item-list">
							<div class="thumb">
								<img v-if="item.thumb" :src="item.thumb" />
								<img v-if="!item.thumb" src="../../assets/login/loginBanner.jpg" />
								<p class="name">{{item.name}}</p>
							</div>
							<div class="attribute">
								<Row>
									<Col span="12">原价：<span class="price original">${{item.original}}</span>元</Col>
									<Col span="12">售价：<span class="price present">${{item.present}}</span>元</Col>
									<Col span="24" class="intro" v-if="false">
										<div v-html="item.intro?item.intro:'暂无简介'"></div>
									</Col>
									<Col span="18" class="tools">
									<Tooltip :content="(item.shelves=='yes'?'下架':'上架')" placement="top-start">
										<Icon custom="iconfont icon-shelves" :active="item.shelves" @click="clickAttr(item,index,'shelves')" />
									</Tooltip>
									<Tooltip :content="(item.hot=='yes'?'取消':'')+'热门'" placement="top-start">
										<Icon custom="iconfont icon-remen" :active="item.hot" @click="clickAttr(item,index,'hot')" />
									</Tooltip>
									<Tooltip :content="(item.recom=='yes'?'取消':'')+'推荐'" placement="top-start">
										<Icon custom="iconfont icon-tuijian" :active="item.recom" @click="clickAttr(item,index,'recom')" />
									</Tooltip>
									<Tooltip :content="(item.top=='yes'?'取消':'')+'置顶'" placement="top-start">
										<Icon custom="iconfont icon-zhiding" :active="item.top" @click="clickAttr(item,index,'top')" />
									</Tooltip>
									</Col>
									<Col span="6" class="text-right tools">
									<Tooltip content="价格" placement="top-start">
										<Icon custom="iconfont icon-price" @click="clickPrice(item,index)" />
									</Tooltip>
									<Tooltip content="编辑" placement="top-start">
										<Icon custom="iconfont icon-edit" @click="clickEdit(item,index)" />
									</Tooltip>
									<Tooltip content="删除" placement="top-start">
										<Icon custom="iconfont icon-delete" @click="clickDel(item,index)" />
									</Tooltip>
									</Col>
								</Row>
							</div>
						</div>
						</Col>
						<Col span="8" offset="8" class="text-center empty-data" v-if="itemList.length<1">
						<Card>
							<h1>暂无【{{activeMenu.name}}】数据</h1>
							<h3>Temporarily no data</h3>
						</Card>
						</Col>
					</Row>
					<Divider dashed />
					<Row>
						<Col span="24" class="text-center">
						<Button type="info" :disabled="ISLoad.disabled" :loading="ISLoad.per" @click="handleLoadMore">
							{{ISLoad.text}}
						</Button>
						</Col>
					</Row>
				</div>
			</div>
		</div>

		<Modal ref="addModal" v-model="addModal" :title="'添加'+activeMenu.name" scrollable width="800">
			<p slot="footer">
				<Button type="info" @click="handleSubmit">确定</Button>
			</p>
			<Row>
				<Form ref="addForm" :model="addForm" :rules="addFormRule" :label-width="80">
					<Col span="15">

					<FormItem label="显示名称" prop="name">
						<Input :placeholder="activeMenu.name+'显示名称,例如:网络即时'+activeMenu.name" v-model="addForm.name"></Input>
					</FormItem>
					<FormItem :label="activeMenu.name+'原价'" prop="price">
						<InputNumber v-model='addForm.original' :step="1.00"></InputNumber>
						<span>&nbsp;&nbsp;{{activeMenu.name}}售价</span>
						<InputNumber v-model='addForm.present' :step="1.00"></InputNumber>
					</FormItem>
					<FormItem :label="activeMenu.name+'属性'">
						<Checkbox label="shelves" v-model="addForm.shelves" true-value="yes" false-value="no">上架</Checkbox>
						<Checkbox label="hot" v-model="addForm.hot" true-value="yes" false-value="no">热门</Checkbox>
						<Checkbox label="recom" v-model="addForm.recom" true-value="yes" false-value="no">推荐</Checkbox>
						<Checkbox label="top" v-model="addForm.top" true-value="yes" false-value="no">置顶</Checkbox>
					</FormItem>
					<FormItem :label="activeMenu.name+'设置'">
						<Button type="primary" icon="logo-usd" @click="priceModal=true">动态价格</Button>
						<ButtonGroup>
							<Button type="primary" icon="ios-help-buoy" @click="knowModal.show=true">票务须知</Button>
							<Button v-if="addForm.know_id">已选择:{{addForm.know_id}}</Button>
						</ButtonGroup>
					</FormItem>
					</Col>
					<Col span="8" offset="1">
					<Upload ref="upload" type="drag" :action="upload.url" :headers="upload.header" accept="image" :format="['jpg','jpeg','png']"
					 name="file" :data="{uploadType:'img'}" :show-upload-list="false" :on-success="uploadSuccess">
						<div :style="'padding:50px 0px;background:url('+upload.path+');background-size:100% 100%;'">
							<Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
							<p style="color: #3399FF;">点击或拖动文件上传</p>
						</div>
					</Upload>
					<Button type="warning" size="small" long @click="uploadDel">删除</Button>
					</Col>
					<Col span="24">
					<FormItem :label="activeMenu.name+'介绍'">
						<Tinymce ref="intro" v-model="addForm.intro" />
					</FormItem>
					</Col>
				</Form>
			</Row>
		</Modal>

		<Modal ref="priceModal" v-model="priceModal" title="动态价格" scrollable :z-index="1001" :closable="false" :mask-closable="false">
			<Tabs type="card">
				<TabPane label="所有日期">
					<Form :label-width="60">
						<FormItem label="日期范围" prop="name">
							<Row>
								<Col span="12">
								<DatePicker type="date" :options="dateOption" placeholder="开始日期" v-model="priceForm.date.start" @on-change="priceForm.date.start=$event"></DatePicker>
								</Col>
								<Col span="12">
								<DatePicker type="date" :options="dateOption" placeholder="结束日期" v-model="priceForm.date.end" @on-change="priceForm.date.end=$event"></DatePicker>
								</Col>
							</Row>
						</FormItem>
						<FormItem :label="activeMenu.name+'价格'" prop="name">
							<span>成本</span>
							<InputNumber v-model='priceForm.date.cost' :step="1.00" :min="0"></InputNumber>
							<span>+利润</span>
							<InputNumber v-model='priceForm.date.profit' :step="1.00" :min="0"></InputNumber>
							<span>售价：{{priceForm.date.cost+priceForm.date.profit}}元</span>
						</FormItem>
						<FormItem label="库存" prop="name">
							<Input placeholder="库存" v-model="priceForm.date.number">
							<span slot="append">张/天</span>
							</Input>
						</FormItem>
						<FormItem label="价格描述" prop="name">
							<Input placeholder="价格调整描述" type="textarea" v-model="priceForm.remark"></Input>
						</FormItem>
					</Form>
				</TabPane>
				<TabPane label="按星期">
					<Form :label-width="60">
						<FormItem label="日期范围" prop="name">
							<Row>
								<Col span="12">
								<DatePicker type="date" :options="dateOption" placeholder="开始日期" v-model="priceForm.week.start" @on-change="priceForm.week.start=$event"></DatePicker>
								</Col>
								<Col span="12">
								<DatePicker type="date" :options="dateOption" placeholder="结束日期" v-model="priceForm.week.end" @on-change="priceForm.week.end=$event"></DatePicker>
								</Col>
							</Row>
						</FormItem>
						<FormItem :label="activeMenu.name+'价格'" prop="name">
							<span>成本</span>
							<InputNumber v-model='priceForm.week.cost' :step="1.00" :min="0"></InputNumber>
							<span>+利润</span>
							<InputNumber v-model='priceForm.week.profit' :step="1.00" :min="0"></InputNumber>
							<span>售价：{{priceForm.week.cost+priceForm.week.profit}}</span>
						</FormItem>
						<FormItem label="库存" prop="name">
							<Input placeholder="库存" v-model="priceForm.week.number">
							<span slot="append">张/天</span>
							</Input>
						</FormItem>
						<FormItem label="星期" prop="name">
							<CheckboxGroup v-model="priceForm.week.week">
								<Checkbox label="1">周一</Checkbox>
								<Checkbox label="2">周二</Checkbox>
								<Checkbox label="3">周三</Checkbox>
								<Checkbox label="4">周四</Checkbox>
								<Checkbox label="5">周五</Checkbox>
								<Checkbox label="6">周六</Checkbox>
								<Checkbox label="7">周日</Checkbox>
							</CheckboxGroup>
						</FormItem>
						<FormItem label="价格描述" prop="name">
							<Input placeholder="价格调整描述" type="textarea" v-model="priceForm.week.remark"></Input>
						</FormItem>
					</Form>
				</TabPane>
				<TabPane label="按号数">
					<Form :label-width="60">
						<FormItem label="日期选择" prop="name">
							<DatePicker type="date" :options="dateOption" multiple style="width: 100%;" v-model="priceForm.day.day"
							 @on-change="priceForm.day.day=$event"></DatePicker>
						</FormItem>
						<FormItem :label="activeMenu.name+'价格'" prop="name">
							<span>成本</span>
							<InputNumber v-model='priceForm.day.cost' :step="1.00" :min="0"></InputNumber>
							<span>+利润</span>
							<InputNumber v-model='priceForm.day.profit' :step="1.00" :min="0"></InputNumber>
							<span>售价：{{priceForm.day.cost+priceForm.day.profit}}</span>
						</FormItem>
						<FormItem label="库存" prop="name">
							<Input placeholder="库存" v-model="priceForm.day.number">
							<span slot="append">张/天</span>
							</Input>
						</FormItem>
						<FormItem label="价格描述" prop="name">
							<Input placeholder="价格调整描述" type="textarea" v-model="priceForm.day.remark"></Input>
						</FormItem>
					</Form>
				</TabPane>
			</Tabs>
			<p slot="footer">
				<Button type="info" @click="priceModal=false">确定</Button>
			</p>
		</Modal>

		<Modal ref="editModal" v-model="editModal" :title="'修改'+editForm.name" scrollable width="800">
			<p slot="footer">
				<Button type="info" @click="handleEdit">确定</Button>
			</p>
			<Row>
				<Form ref="editForm" :model="editForm" :rules="addFormRule" :label-width="80">
					<Col span="15">

					<FormItem label="显示名称" prop="name">
						<Input :placeholder="editForm.name+'显示名称,例如:网络即时'+activeMenu.name" v-model="editForm.name"></Input>
					</FormItem>
					<FormItem :label="activeMenu.name+'原价'" prop="price">
						<InputNumber v-model='editForm.original' :step="1.00"></InputNumber>
						<span>&nbsp;&nbsp;{{activeMenu.name}}售价</span>
						<InputNumber v-model='editForm.present' :step="1.00"></InputNumber>
					</FormItem>
					<FormItem :label="activeMenu.name+'属性'">
						<Checkbox label="shelves" v-model="editForm.shelves" true-value="yes" false-value="no">上架</Checkbox>
						<Checkbox label="hot" v-model="editForm.hot" true-value="yes" false-value="no">热门</Checkbox>
						<Checkbox label="recom" v-model="editForm.recom" true-value="yes" false-value="no">推荐</Checkbox>
						<Checkbox label="top" v-model="editForm.top" true-value="yes" false-value="no">置顶</Checkbox>
					</FormItem>
					<FormItem :label="activeMenu.name+'设置'">
						<ButtonGroup>
							<Button type="primary" icon="ios-help-buoy" @click="knowModal.show=true">票务须知</Button>
							<Button v-if="editForm.know_id">已选择:{{editForm.know_id}}</Button>
						</ButtonGroup>
					</FormItem>
					</Col>
					<Col span="8" offset="1">
					<Upload ref="upload" type="drag" :action="upload.url" :headers="upload.header" accept="image" :format="['jpg','jpeg','png']"
					 name="file" :data="{uploadType:'img'}" :show-upload-list="false" :on-success="uploadSuccess">
						<div :style="'padding:50px 0px;background-image:url('+upload.path+');background-size:100% 100%;'">
							<Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
							<p style="color: #3399FF;">点击或拖动文件上传</p>
						</div>
					</Upload>
					<Button type="warning" size="small" long @click="uploadDel">删除</Button>
					</Col>
					<Col span="24">
					<FormItem :label="activeMenu.name+'介绍'">
						<Tinymce ref="editIntro" v-model="editForm.intro" />
					</FormItem>
					</Col>
				</Form>
			</Row>
		</Modal>

		<Modal ref="knowModal" v-model="knowModal.show" title="票务须知" footer-hide scrollable :z-index="1001" :closable="false" :mask-closable="false">
			<Table border :data="knowModal.data" :columns="knowModal.columns" size="small"></Table>
		</Modal>
		
		<Drawer :closable="false" width="414" v-model="knowModal.drawer.show" class-name="drawer">
			<div slot="header" class="text-center">{{knowModal.drawer.title}}</div>
			<p :style="knowModal.drawer.pSytle">预订说明</p>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">预订时间</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.book_text}}</div>
			</div>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">有效期</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.aging_text}}</div>
			</div>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">适用条件</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.apply}}</div>
			</div>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">限购政策</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.limit}}</div>
			</div>
			<p :style="knowModal.drawer.pSytle">费用说明</p>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">费用包含</label>
				<div v-html="knowModal.drawer.data.fee"></div>
			</div>
			<p :style="knowModal.drawer.pSytle">使用说明</p>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">使用方法</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.use_method}}</div>
			</div>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">取票点</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.address}}</div>
			</div>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">取票时间</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.start_time}}-{{knowModal.drawer.data.end_time}}</div>
			</div>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">补充说明</label>
				<div :style="knowModal.drawer.detalisStyle">{{knowModal.drawer.data.details}}</div>
			</div>
			<p :style="knowModal.drawer.pSytle">退改说明</p>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">退改规则</label>
				<div v-html="knowModal.drawer.data.refund"></div>
			</div>
			<p :style="knowModal.drawer.pSytle">其他说明</p>
			<div :style="knowModal.drawer.itemStyle">
				<label :style="knowModal.drawer.labelStyle">发票说明</label>
				<div v-html="knowModal.drawer.data.invoice"></div>
			</div>
		</Drawer>
	</div>
</template>

<script>
	import Tinymce from '@/components/Tinymce'
	import request from '@/utils/request'
	export default {
		name: 'ticket_list',
		components: {
			Tinymce,
		},
		data() {
			return {
				knowModal: {
					show: false,
					data: [],
					drawer: {
						title: '',
						show: false,
						data: [],
						pSytle: {
							fontSize: '16px',
							color: 'rgba(0,0,0,0.85)',
							lineHeight: '24px',
							display: 'block',
							marginTop: '15px',
							marginBottom: '15px',
							fontWeight: 600,
						},
						itemStyle: {
							position: 'relative',
							paddingLeft: '68px',
							lineHeight: '38px',
							minHeight: '38px'
						},
						labelStyle: {
							position: 'absolute',
							wdith: '6px',
							left: '0px',
							width: '60px',
							fontSize: '14px',
							color: '#000000',
							textAlign: 'right'
						},
						detalisStyle: {}
					},
					columns: [{
						width: 190,
						title: '标识',
						key: 'uniqid'
					}, {
						title: '名称',
						key: 'name'
					}, {
						width: 116,
						align: 'center',
						render: (h, params) => {
							var that = this;
							return h('ButtonGroup', [
								h('Button', {
									props: {
										type: 'primary',
										size: 'small'
									},
									on: {
										click: () => {
											that.addForm.know_id = params.row.uniqid
											that.editForm.know_id = params.row.uniqid
											that.knowModal.show = false;
										}
									}
								}, '选择'),
								h('Button', {
									props: {
										type: 'info',
										size: 'small'
									},
									on: {
										click: () => {
											that.knowModal.drawer.show = true;
											that.knowModal.drawer.title = '购买须知-' + params.row.name;
											that.knowModal.drawer.data = params.row;
											switch (params.row.book_type) {
												case 1:
													that.knowModal.drawer.data.book_text = '仅限当天预订';
													break;
												case 2:
													that.knowModal.drawer.data.book_text = '需提前' + params.row.book_day + '天预订';
													break;
												case 3:
													that.knowModal.drawer.data.book_text = '可提前' + params.row.book_day + '天预订';
													break;
											}
											switch (params.row.aging_type) {
												case 1:
													that.knowModal.drawer.data.aging_text = '仅限当天使用';
													break;
												case 2:
													that.knowModal.drawer.data.aging_text = '可提前' + params.row.book_day + '天使用';
													break;
												case 3:
													that.knowModal.drawer.data.aging_text = '可延后' + params.row.book_day + '天使用';
													break;
											}
										}
									}
								}, '详情')
							])
						}
					}]
				},
				activeMenu: {},
				menu: [],
				searchForm: {
					name: '',
					shelves: 'yes',
					recom: true,
					top: true,
					hot: true
				},
				ISLoad: {
					disabled: false,
					text: '加载更多',
					per: false
				},
				itemList: [],
				getParam: {
					page: 1
				},
				dateOption: {
					disabledDate(date) {
						return date && date.valueOf() < Date.now() - 86400000;
					}
				},
				addModal: false,
				addForm: {
					name: '',
					intro: '',
					original: 0.00,
					present: 0.00,
					shelves: 'yes',
					hot: 'yes',
					recom: 'yes',
					top: 'yes',
					know_id: ''
				},
				addFormRule: {
					name: [{
						required: true,
						message: '显示名称不能为空',
						trigger: 'blur'
					}],
					price: [{
						type: 'array',
						message: '请设置价格',
						trigger: 'blur'
					}],
				},
				priceModal: false,
				priceForm: {
					date: {
						start: '',
						end: '',
						cost: 0.00,
						profit: 0.00,
						number: 0,
						remark: ''
					},
					week: {
						start: '',
						end: '',
						cost: 0.00,
						profit: 0.00,
						number: 0,
						remark: '',
						week: []
					},
					day: {
						day: '',
						cost: 0.00,
						profit: 0.00,
						number: 0,
						remark: ''
					}
				},
				upload: {
					url: '/upload',
					header: {
						'AUTH_TOKEN': this.$store.getters.token,
						'AUTHORIZATION': window.location.hostname
					},
					path: '',
					name: '',
					hash: ''
				},
				editModal: false,
				editForm: {
					name: '',
					intro: '',
					original: 0.00,
					present: 0.00,
					shelves: 'yes',
					hot: 'yes',
					recom: 'yes',
					top: 'yes',
					know_id: ''
				},
				editIndex: 0
			}
		},
		mounted() {
			this.$store.dispatch('getTicketType').then((result) => {
				this.menu = result;
				this.$nextTick(function() {
					this.activeMenu = result[0];
					this.render(this.activeMenu.uniqid);
				})
			})
			this.$store.dispatch('getTicketKnowAll').then((result) => {
				this.knowModal.data = result;
			})
		},
		methods: {
			render(uniqid, callback) {
				var that = this;
				that.getParam['type'] = uniqid;
				that.$store.dispatch('getTicketList', that.getParam).then((result) => {
					if (result.data.length < 1) {
						that.ISLoad.text = '没有更多数据了';
						that.ISLoad.disabled = true;
						that.ISLoad.per = false;
					} else {
						that.itemList = that.itemList.concat(result.data);
						that.ISLoad.text = '加载更多';
						that.ISLoad.per = false;
						that.ISLoad.disabled = false;
					}
					typeof(callback) == 'function' ? callback(): '';
				})
			},
			tabMenu(name) {
				var that = this;
				let activeMenu = this.menu.find((item) => {
					if (item.uniqid == name) {
						return item;
					}
				})
				that.getParam.page = 1;
				that.itemList = [];
				this.render(activeMenu.uniqid, function() {
					that.activeMenu = activeMenu;
				});
			},
			uploadSuccess(response) {
				this.upload.name = response.data.name;
				this.upload.path = response.data.url;
				this.upload.hash = response.data.hash;
			},
			uploadDel() {
				request({
					url: 'removeUpload',
					method: 'post',
					data: {
						hash: this.upload.hash
					}
				}).then(() => {
					this.upload.name = '';
					this.upload.path = '';
					this.upload.hash = '';
					this.$refs.upload.clearFiles;
				})
			},
			handleLoadMore() {
				var that = this;
				that.ISLoad.text = '加载中...';
				that.ISLoad.per = true;
				that.getParam.page += 1;
				that.render(that.activeMenu.uniqid)
			},
			clickAttr(item, index, act) {
				var that = this;
				var value = item[act] == 'yes' ? 'no' : 'yes';
				that.$store.dispatch('setTicketListAttr', {
					type: act,
					value: value,
					id: item.id
				}).then(() => {
					that.itemList[index][act] = value;
				})
			},
			clickPrice(item, index) {
				this.$router.replace({
					name: 'ticket_price',
					params: {
						ticket: item
					}
				})
			},
			clickEdit(data, index) {
				this.editForm = {
					original: parseFloat(data['original']),
					present: parseFloat(data['present']),
					name: data['name'],
					intro: data['intro'],
					shelves: data['shelves'],
					hot: data['hot'],
					recom: data['recom'],
					id: data['id'],
					top: data['top'],
					know_id:data['know_id']
				};
				this.upload.path = data.thumb;
				this.upload.hash = data.thumbHash;
				this.upload.name = data.name;
				this.$refs.editIntro.setContent(data.intro);
				this.editModal = true;
				this.editIndex = index;
			},
			clickDel(item, index) {
				var that = this;
				that.$Modal.confirm({
					title: '提示',
					content: '确定要删除该条数据吗？此操作不可恢复',
					onOk: function() {
						that.$store.dispatch('removeTicketList', {
							id: item.id
						}).then(() => {
							that.itemList.splice(index, 1)
						})
					}
				})
			},
			handleEdit() {
				this.$refs['editForm'].validate((valid) => {
					if (valid) {
						var that = this,
							param = that.editForm;
						param['thumb'] = that.upload.hash;
						param['type'] = that.activeMenu.uniqid;
						that.$store.dispatch('editTicketList', param).then((result) => {
							result['thumb'] = that.upload.path;
							result['id'] = that.editForm.id;
							that.itemList[that.editIndex] = result;
							that.upload.name = '';
							that.upload.path = '';
							that.upload.hash = '';
							that.$refs['editForm'].resetFields();
							that.$Message.success('编辑成功');
							that.editModal = false;
						})
					}
				})
			},
			handleSubmit() {
				this.$refs['addForm'].validate((valid) => {
					if (valid) {
						var that = this,
							param = that.addForm;
						param['thumb'] = that.upload.hash;
						param['type'] = that.activeMenu.uniqid;
						param['price'] = that.priceForm;
						that.$store.dispatch('setTicketList', param).then((result) => {
							that.addModal = false;
							that.upload.name = '';
							that.upload.path = '';
							that.upload.hash = '';
							that.$refs['addForm'].resetFields();
							that.itemList.push(result);
							that.$Message.success('添加成功');
						})
					}
				})
			},
			handleSearch() {
				var that = this;
				var where = this.searchForm;
				where['type'] = this.activeMenu.uniqid;
				where['page'] = 1;

				that.$store.dispatch('getTicketList', where).then((result) => {
					that.itemList = result;
					if (result.length < 1) {
						that.ISLoad.text = '暂无相关数据';
						that.ISLoad.disabled = true;
						that.ISLoad.per = false;
					} else {
						that.ISLoad.text = '加载更多';
						that.ISLoad.per = false;
						that.ISLoad.disabled = false;
					}
				})
			}
		}
	}
</script>

<style lang="less">
	.ticket_list_page {
		height: 100%;
		padding: 0px;
		position: relative;
		.scroll-y{
			position: absolute;
		}
	}

	.ticket_list_page .menu {
		position: absolute;
		height: 100%;
		left: 0px;
		top: 0px;
	}

	.ticket_list_page .menu ul {
		height: 100%;
	}

	.ticket_list_page .main-form {
		padding-left: 240px;
		height: 100%;
		width: 100%;
		overflow: hidden;
		box-sizing: border-box;
	}

	.ticket_list_page .main-area {
		width: calc(100% - 240px);
		position: absolute;
		height: 100%;
		padding: 10px;
		box-sizing: border-box;
	}

	.ticket_list_page .ticket_item .row {
		margin: -5px;
	}

	.ticket_list_page .ticket_item .col {
		padding: 5px;
		box-sizing: border-box;
	}

	.ticket_list_page .ticket_item .col .item-list {
		box-shadow: 0px 0px 3px 0px rgba(0, 0, 0, 0.1);
	}

	.ticket_list_page .ticket_item .col .item-list .thumb {
		position: relative;
		display: block;
	}

	.ticket_list_page .ticket_item .col .item-list .thumb img {
		width: 100%;
		display: block;
		height: 200px;
	}

	.ticket_list_page .ticket_item .col .item-list .thumb .name {
		position: absolute;
		bottom: 0px;
		padding: 10px;
		color: white;
		box-sizing: border-box;
		display: block;
		background: rgba(0, 0, 0, .5);
		width: 100%;
		font-size: 16px;
	}

	.ticket_list_page .ticket_item .col .item-list .thumb .checkbox {
		position: absolute;
		right: -3px;
		top: 0px;
	}

	.ticket_list_page .ticket_item .attribute {
		padding: 10px;
		box-sizing: border-box;
	}

	.ticket_list_page .ticket_item .attribute .price {
		font-size: 24px;
		margin: 0 4px;
	}

	.ticket_list_page .ticket_item .attribute .price.original {
		color: #ed4014;
		text-decoration: line-through;
	}

	.ticket_list_page .ticket_item .attribute .price.present {
		color: #19be6b;
	}

	.ticket_list_page .ticket_item .attribute .intro {
		-webkit-line-clamp: 3;
		height: auto;
		line-height: 22px;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		overflow: hidden;
		min-height: 64px;
	}

	.ticket_list_page .ticket_item .attribute i {
		font-size: 20px;
		cursor: pointer;
	}

	.ticket_list_page .ticket_item .attribute .tools {
		margin-top: 8px;
	}

	.ticket_list_page .ticket_item .attribute .tools i {
		margin-right: 2px;
	}

	.ticket_list_page .ticket_item .attribute .tools i[active="yes"] {
		color: #009688;
	}

	.empty-data {
		padding: 20px;
	}

	.drawer {
		z-index: 1200;
	}
</style>

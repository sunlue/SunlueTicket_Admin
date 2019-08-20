<template>
	<div tag="pay_weixin" class="page">
		<div class="scroll-y">
			<Row>
				<Col :xs="24" :sm="12" :lg="8">
					<Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="126">
						<Divider orientation="left">基本配置</Divider>
						<FormItem label="显示名称" prop="name">
							<Input v-model="formValidate.name" placeholder="微信支付显示名称" />
						</FormItem>
						<FormItem label="设备支持" prop="equipment">
							<CheckboxGroup v-model="formValidate.equipment">
								<Checkbox label="all">通用</Checkbox>
								<Checkbox label="pc">电脑设备</Checkbox>
								<Checkbox label="wap">移动设备(H5)</Checkbox>
							</CheckboxGroup>
						</FormItem>
						<FormItem label="手续费" prop="poundage">
							<RadioGroup v-model="formValidate.poundage">
								<Radio label="%">
									<Icon type="social-apple"></Icon>
									<span>
										<InputNumber v-model="formValidate.poundage_proport" :max="100" :disabled="(formValidate.poundage=='$')" :formatter="value => `${value}%`" :parser="value => value.replace('%', '')"></InputNumber>
									</span>
								</Radio>
								<Radio label="$">
									<Icon type="social-apple"></Icon>
									<span>
										<InputNumber v-model="formValidate.poundage_money" :disabled="(formValidate.poundage=='%')" :formatter="value => `$ ${value}`.replace(/B(?=(d{3})+(?!d))/g, ',')" :parser="value => value.replace(/$s?|(,*)/g, '')"></InputNumber>
									</span>
								</Radio>
							</RadioGroup>
						</FormItem>
						<Divider orientation="left">应用配置</Divider>
						<FormItem label="AppID" prop="appid">
							<Input v-model="formValidate.appid" placeholder="微信公众号的AppID(应用ID)" />
						</FormItem>
						<FormItem label="AppSecret" prop="secret">
							<Input v-model="formValidate.secret" placeholder="微信公众号的AppSecret(应用密钥)" />
						</FormItem>
						<Divider orientation="left">支付配置</Divider>
						<FormItem label="支付账号(mchId)" prop="mchid">
							<Input v-model="formValidate.mchid" placeholder="微信商户号mchid(支付ID)" />
						</FormItem>
						<FormItem label="支付密钥(mchKey)" prop="mchkey">
							<Input v-model="formValidate.mchkey" placeholder="微信商户号mchkey(支付密钥)" type="password"/>
						</FormItem>
						<FormItem label="状态" prop="swtich">
							<RadioGroup v-model="formValidate.swtich">
								<Radio label="open">启用</Radio>
								<Radio label="close">关闭</Radio>
							</RadioGroup>
						</FormItem>
						<FormItem>
							<Button type="primary" v-on:click="submit('formValidate')">提交</Button>
							<Button v-on:click="reset('formValidate')">重置</Button>
						</FormItem>
					</Form>
				</Col>
			</Row>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'pay_weixin',
		data() {
			return {
				formValidate: {
					name: '微信支付',
					equipment: ['all'],
					poundage: '%',
					poundage_proport: 0.00,
					poundage_money: 0,
					secret: '',
					appid: '',
					mchid: '',
					mchkey: '',
					swtich: 'open'
				},
				ruleValidate: {
					mchid: [{
						required: true,
						message: '请输入支付账号(mchId)',
						trigger: 'blur'
					}],
					mchkey: [{
						required: true,
						message: '请输入支付密钥(mchKey)',
						trigger: 'blur'
					}],
				}
			}
		},
		mounted() {
			var that = this;
			this.$store.dispatch('getPayConfig', {
				provider: 'weixin'
			}).then((result) => {
				var form = result.config;
				form['swtich'] = result.swtich;
				that.formValidate = form;
			})
		},
		methods: {
			submit: function(name) {
				var that = this;
				that.check(name, function() {
					that.$store.dispatch('setPayConfigWeixin', that.formValidate).then(() => {
						that.$Message.success('提交成功')
					})
				})
			},
			check: function(name, callback) {
				this.$refs[name].validate((valid) => {
					if (valid) {
						typeof callback == 'function' ? callback(valid) : ''
					}
				})
			},
			reset: function(name) {
				this.$refs[name].resetFields();
			}
		}
	}
</script>

<style lang="less">
	div[tag="pay_weixin"]{
		padding:0px;
		.scroll-y{
			position: absolute;
			width: 100%;
			padding: 10px 5px;
		}
	}
</style>

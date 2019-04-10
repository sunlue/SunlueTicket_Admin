<template>
	<div class="page">
		<Row>
			<Col :xs="24" :sm="12" :lg="8">
				<Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="146">
					<Divider orientation="left">基本配置</Divider>
					<FormItem label="显示名称" prop="name">
						<Input v-model="formValidate.name" placeholder="支付宝显示名称" />
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
									<InputNumber v-model="formValidate.poundage_proport" :max="100" :disabled="(formValidate.poundage=='$')" :formatter="value => `${value}%`" :parser="value => value.replace('%', '')" />
								</span>
							</Radio>
							<Radio label="$">
								<Icon type="social-apple"></Icon>
								<span>
									<InputNumber v-model="formValidate.poundage_money" :disabled="(formValidate.poundage=='%')" :formatter="value => `$ ${value}`.replace(/B(?=(d{3})+(?!d))/g, ',')" :parser="value => value.replace(/$s?|(,*)/g, '')" />
								</span>
							</Radio>
						</RadioGroup>
					</FormItem>
					<Divider orientation="left">支付配置</Divider>
					<FormItem label="支付宝账号" prop="account">
						<Input v-model="formValidate.account" placeholder="签约支付宝账号或卖家支付宝帐户" />
					</FormItem>
					<FormItem label="合作者身份(partner ID)" prop="partnerid">
						<Input v-model="formValidate.partnerid" placeholder="合作身份者ID，以2088开头由16位纯数字组成的字符串" />
					</FormItem>
					<FormItem label="交易安全校验码(key)" prop="partnerkey">
						<Input v-model="formValidate.partnerkey" placeholder="交易安全检验码，由数字和字母组成的32位字符串" type="password" />
					</FormItem>
					<FormItem label="接口交易类型" prop="trading">
						<RadioGroup v-model="formValidate.trading">
							<Radio label="0">即时到账</Radio>
							<Radio label="1">担保交易</Radio>
						</RadioGroup>
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
</template>

<script>
	export default {
		name: 'alipay',
		data() {
			return {
				formValidate: {
					name: '支付宝',
					equipment: ['all'],
					poundage: '%',
					poundage_proport: 0.00,
					poundage_money: 0,
					account: '',
					partnerid: '',
					partnerkey: '',
					trading: '0',
					swtich: 'open'
				},
				ruleValidate: {
					account: [{
						required: true,
						message: '请输入支付宝账号',
						trigger: 'blur'
					}],
					partnerid: [{
						required: true,
						message: '请输入合作身份者ID',
						trigger: 'blur'
					}],
					partnerkey: [{
						required: true,
						message: '请输入交易安全校验码',
						trigger: 'blur'
					}],
				}
			}
		},
		mounted() {
			var that = this;
			this.$store.dispatch('getPayConfig', {
				provider: 'alipay'
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
					that.$store.dispatch('setPayConfigAlipay', that.formValidate).then(() => {
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

<style>
</style>

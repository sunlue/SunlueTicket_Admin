<template>
	<div class="page" tag="config_weixin">
		<div class="scroll-y">
			<Row>
				<Col :xs="24" :sm="16" :lg="12">
				<Form ref="form" :model="form" :label-width="160">
					<Tabs value="public">
						<TabPane label="微信公众平台" name="public">
							<Divider orientation="left">基本配置</Divider>
							<FormItem label="AppID">
								<Input v-model="form.public.appid" placeholder="微信公众号的AppID(应用ID)" />
							</FormItem>
							<FormItem label="AppSecret">
								<Input v-model="form.public.secret" placeholder="微信公众号的AppSecret(应用密钥)" />
							</FormItem>
							<FormItem label="网页授权">
								<RadioGroup v-model="form.public.scope">
									<Radio label="snsapi_base">初始静默授权</Radio>
									<Radio label="snsapi_userinfo">初始非静默授权</Radio>
								</RadioGroup>
							</FormItem>
							<FormItem label="状态">
								<RadioGroup v-model="form.public.swtich">
									<Radio label="open">启用</Radio>
									<Radio label="close">关闭</Radio>
								</RadioGroup>
							</FormItem>
							<FormItem>
								<Button type="primary" v-on:click="submit('form')">提交</Button>
								<Button v-on:click="reset('form')">重置</Button>
							</FormItem>
						</TabPane>
						<TabPane label="微信小程序" name="mini_program">
							<Divider orientation="left">基本配置</Divider>
							<FormItem label="AppID">
								<Input v-model="form.mini_program.appid" />
							</FormItem>
							<FormItem label="AppSecret">
								<Input v-model="form.mini_program.secret" />
							</FormItem>
							<FormItem label="状态">
								<RadioGroup v-model="form.mini_program.swtich">
									<Radio label="open">启用</Radio>
									<Radio label="close">关闭</Radio>
								</RadioGroup>
							</FormItem>
							<Divider orientation="left">服务器配置</Divider>
							<FormItem label="request合法域名" v-if="(form.mini_program.server.swtich=='open')">
								<Input v-model="form.mini_program.server.request" />
							</FormItem>
							<FormItem label="socket合法域名" v-if="(form.mini_program.server.swtich=='open')">
								<Input v-model="form.mini_program.server.socket" />
							</FormItem>
							<FormItem label="uploadFile合法域名" v-if="(form.mini_program.server.swtich=='open')">
								<Input v-model="form.mini_program.server.uploadFile" />
							</FormItem>
							<FormItem label="downloadFile合法域名" v-if="(form.mini_program.server.swtich=='open')">
								<Input v-model="form.mini_program.server.downloadFile" />
							</FormItem>
							<FormItem label="状态">
								<RadioGroup v-model="form.mini_program.server.swtich">
									<Radio label="open">启用</Radio>
									<Radio label="close">关闭</Radio>
								</RadioGroup>
							</FormItem>
							<Divider orientation="left">消息推送</Divider>
							<FormItem label="URL(服务器地址)" v-if="(form.mini_program.message.swtich=='open')">
								<Input v-model="form.mini_program.message.server_url" />
							</FormItem>
							<FormItem label="Token(令牌)" v-if="(form.mini_program.message.swtich=='open')">
								<Input v-model="form.mini_program.message.token" />
							</FormItem>
							<FormItem label="EncodingAESKey(消息加密密钥)" v-if="(form.mini_program.message.swtich=='open')">
								<Input v-model="form.mini_program.message.aeskey" />
							</FormItem>
							<FormItem label="消息加密方式" v-if="(form.mini_program.message.swtich=='open')">
								<RadioGroup v-model="form.mini_program.message.encryption_method" vertical>
									<Radio label="1">明文模式(不使用消息体加解密功能，安全系数较低)</Radio>
									<Radio label="2">兼容模式(明文、密文将共存，方便开发者调试和维护)</Radio>
									<Radio label="3">安全模式(消息包为纯密文，需要开发者加密和解密，安全系数高)</Radio>
								</RadioGroup>
							</FormItem>
							<FormItem label="数据格式" v-if="(form.mini_program.message.swtich=='open')">
								<RadioGroup v-model="form.mini_program.message.data_type">
									<Radio label="JSON">JSON</Radio>
									<Radio label="XML">XML</Radio>
								</RadioGroup>
							</FormItem>
							<FormItem label="状态">
								<RadioGroup v-model="form.mini_program.message.swtich">
									<Radio label="open">启用</Radio>
									<Radio label="close">关闭</Radio>
								</RadioGroup>
							</FormItem>
							<FormItem>
								<Button type="primary" v-on:click="submit('form')">提交</Button>
								<Button v-on:click="reset('form')">重置</Button>
							</FormItem>
						</TabPane>
					</Tabs>
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
				form: {
					public: {
						appid: '',
						secret: '',
						scope: 'snsapi_base',
						swtich: 'open'
					},
					mini_program: {
						appid: '',
						secret: '',
						swtich: 'open',
						server: {
							swtich: 'close',
							request: '',
							socket: '',
							uploadFile: '',
							downloadFile: '',
						},
						message: {
							swtich: 'close',
							server_url: '',
							token: '',
							aeskey: '',
							encryption_method: '1',
							data_type: 'JSON'
						}
					},
				},
			}
		},
		mounted() {
			this.$store.dispatch('getSysConfig', {
				provider: 'weixin'
			}).then((result) => {
				this.form = result.config;
			})
		},
		methods: {
			submit: function(name) {
				let params = this.form;
				params['provider'] = 'weixin';
				this.$store.dispatch('setSysConfig', params).then(() => {
					this.$Message.success('提交成功')
				})
			},
			reset: function(name) {
				this.$refs[name].resetFields();
			}
		}
	}
</script>

<style lang="less">
	div[tag="config_weixin"]{
		padding:0px;
		.scroll-y{
			position: absolute;
			width: 100%;
			padding: 10px 5px;
		}
	}
</style>
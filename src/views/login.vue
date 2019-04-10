<template>
	<div class="full login">
		<div class="head">
			<div class="container">
				<img src="../assets/logo.png" class="logo" />
				<span class="sys_name">TICKET票务管理系统</span>
			</div>
		</div>
		<div class="body">
			<div class="container">
				<div class="login-box password" v-if="(loginType=='password')">
					<i class="icon" title="手机扫码，安全登录" v-on:click="switchLoginType('qrcode')"></i>
					<h1>密码登录</h1>
					<div class="form-block error">
						<input type="text" placeholder="请输入账号" v-model="form.account" />
					</div>
					<div class="form-block">
						<input type="password" placeholder="请输入密码" v-model="form.password" />
					</div>
					<div class="form-block">
						<drag ref="captcha"></drag>
					</div>
					<div class="form-block">
						<button type="button" v-on:click="login">登录</button>
					</div>
				</div>
				<div class="login-box qrcode" v-if="(loginType=='qrcode')">
					<i class="icon" title="密码登录" v-on:click="switchLoginType('password')"></i>
					<h1>手机扫码，安全登录</h1>
					<div class="qrcode-box">
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAAEYCAIAAAAI7H7bAAAFQklEQVR4nO3dUU4cMRQAwdko978yOQEWchrzzFb9RsDATssfL7ZfHx8fD/B//vz0A8BvICQICAkCQoKAkCAgJAgICQJCgsDfxb+9Xq9jz5FbDJoXv1f+VQv5N8ztvQB7f8P51h+KFQkCQoKAkCAgJAgICQJCgoCQICAkCKwGsgsmhl/8qpOz2vyvcXK0evUb9ViRICEkCAgJAkKCgJAgICQICAkCQoLA5kB2Yf6o7uQTDhkZ5zt/T85P579RjxUJEkKCgJAgICQICAkCQoKAkCAgJAj0A9n5Tg4T9yahQ6auC/PPWz7MigQBIUFASBAQEgSEBAEhQUBIEBASBN5xIDt/3HlyjLtg6vp1ViQICAkCQoKAkCAgJAgICQJCgoCQINAPZOeP6k5ejZobcq/ryVnt/DfqsSJBQkgQEBIEhAQBIUFASBAQEgSEBIHNgez8weXC3jBx/lctDBmtLlz9Rj1WJEgICQJCgoCQICAkCAgJAkKCgJAg8Lpi+2Hr5E7SPSevfM294Rv1WJEgISQICAkCQoKAkCAgJAgICQJCgsAFA9n8ytf8MU7+rIWrP8ohu4y3P2UrEgSEBAEhQUBIEBASBIQEASFBQEgQWB1ZPGQsOH/OuDDkQOCFIbfB7r1sQ06EfqxIkBASBIQEASFBQEgQEBIEhAQBIUFgtUN2yLWeJydr808zXph/LvGQXcbf8aFYkSAgJAgICQJCgoCQICAkCAgJAkKCwOaRxfnOxIWrR6tDjttdMJFPWJEgICQICAkCQoKAkCAgJAgICQJCgsDmkcW/deq697MWD39yLPiGH8oeRxbDUEKCgJAgICQICAkCQoKAkCAgJAisBrIL+ax2yH21Q4aJ86+XXRiy83fhO7bcWpEgICQICAkCQoKAkCAgJAgICQJCgsCUO2SvPol3/v2nQy7bHTJo/g5WJAgICQJCgoCQICAkCAgJAkKCgJAgsNohO//uziGbMa+eTs6fdy8M+T8DjxUJEkKCgJAgICQICAkCQoKAkCAgJAhs7pCdf13p1Vtu9wz5UE6a83tZkSAgJAgICQJCgoCQICAkCAgJAkKCwOYdsied3I279w1PDrWvnroOuUN2wR2y8JOEBAEhQUBIEBASBIQEASFBQEgQ2BzIDtkTenKv65CJ4cL822Dnb7ndZkWCgJAgICQICAkCQoKAkCAgJAgICQKbA9khk7Uh5xLP37Wa7zIeMoNeOHwDshUJAkKCgJAgICQICAkCQoKAkCAgJAj0RxafPGF4/mnGe4bcw3u1k+/GY0WChJAgICQICAkCQoKAkCAgJAgICQKvIXtdT7p63Jk/xtXbe3N2yMJPEhIEhAQBIUFASBAQEgSEBAEhQWC1Q/bqvZOLydrJmeae+U+4J3/CIb/XY0WChJAgICQICAkCQoKAkCAgJAgICQJ33yG7NzI+eaHq/FOar9h/+pk5O3+tSBAQEgSEBAEhQUBIEBASBIQEASFB4OgdsnuG7D/dM39Wmw8ur57wbrMiQUBIEBASBIQEASFBQEgQEBIEhASBfiD7hoaMVq+en+a/8uEzkK1IEBASBIQEASFBQEgQEBIEhAQBIUHAQPar8kno3s/aM2TceXLQfJgVCQJCgoCQICAkCAgJAkKCgJAgICQI9APZOafIHjP/8taFIVPX3OEZtBUJAkKCgJAgICQICAkCQoKAkCAgJAi8bt+Z+JmTm0z3DJlO7hmyQ/bk9t41KxIEhAQBIUFASBAQEgSEBAEhQUBIEFgNZIEvsiJBQEgQEBIEhAQBIUFASBAQEgSEBAEhQeAf9wA8La0JVlMAAAAASUVORK5CYII=">
					</div>
					<div class="qrcode-desc">
						<p>打开<a href="javascript:;">手机微信</a>|<a href="javascript:;">手机支付宝</a></p>
						<p>扫一扫登录</p>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom">
			<div class="container">
				<div class="row">
					<div class="col">
						<img src="../assets/login/service1.png" />
						<h4>网络品牌形象创意</h4>
						<p>互动网站、电子商务开发与运营</p>
					</div>
					<div class="col">
						<img src="../assets/login/service2.png">
						<h4>形象识别系统</h4>
						<p>VIS、标示标牌、动漫形象运用720全景体验、线路导游</p>
					</div>
					<div class="col">
						<img src="../assets/login/service3.png">
						<h4>移动终端应用</h4>
						<p>微信、微网站、移动电子商务APP应用程序开发</p>
					</div>
					<div class="col">
						<img src="../assets/login/service4.png">
						<h4>系统集成</h4>
						<p>智能监控、电子票箱、无线覆盖多媒体展陈</p>
					</div>
				</div>
				<div class="link">
					<a href="http://www.sunlue.com/">关于上略互动</a>
					<a href="http://720view.sunlue.com/">720全景</a>
					<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2746256648&amp;site=qq&amp;menu=yes">联系客服</a>
					<a href="javascript:;" target="_blank">法律声明及隐私权政策</a>
				</div>
				<p class="text-center">
					<em>© 2009-2019 <a href="http://www.sunlue.com" target="_blank">sunlue.com</a> 版权所有</em>
				</p>
			</div>
		</div>
	</div>
</template>

<script>
	import drag from '../components/drag.vue'
	export default {
		name: 'login',
		data() {
			return {
				loginType: 'password',
				form: {
					account: 'admin',
					password: '123456'
				}
			}
		},
		components: {
			drag: drag
		},
		methods: {
			switchLoginType: function(type) {
				this.loginType = type;
			},
			login: function() {
				var drag_state = this.$refs.captcha.confirmSuccess;
				if (this.form.account == '') {
					this.$Message.error('请输入登录账号');
				} else if (this.form.password == '') {
					this.$Message.error('请输入登录密码');
				} else if (drag_state !== true) {
					this.$Message.error('请按住滑块，拖动到最右边');
				} else {
					this.$store.dispatch('login', this.form).then(() => {
						this.$router.replace({
							name: 'main'
						})
					})
				}
			}
		}
	}
</script>

<style>
	.login .head {
		position: relative;
		padding: 20px 0px;
	}

	.login .head .logo {
		height: 44px;
	}

	.login .head .sys_name {
		position: absolute;
		right: 0px;
		line-height: 44px;
		font-size: 20px;
		font-style: italic;
		font-weight: 600;
		letter-spacing: 2px;
		color: #666666;
		text-shadow: 2px 2px 10px #666666;
	}

	.login .body {
		background-image: url(../assets/login/loginBanner.jpg);
		height: calc(100% - 388px);
		height: -moz-calc(100% - 388px);
		height: -webkit-calc(100% - 388px);
		background-position: center center;
		background-size: 100%;
		min-width: 1240px;
		min-height: 500px;
		position: relative;
		width: 100%;
		margin-bottom: 56px;
	}

	.login-box {
		box-sizing: border-box;
		background: rgba(255, 255, 255, .9);
		width: 350px;
		position: absolute;
		right: 0px;
		top: 50%;
		transform: translateY(-50%);
		padding: 25px;
		display: block;
	}

	.login-box h1 {
		font-size: 16px;
		color: #3c3c3c;
		font-weight: 700;
		height: 18px;
		line-height: 18px;
	}

	.login-box .icon {
		content: '';
		width: 48px;
		height: 48px;
		background-size: 100%;
		display: block;
		position: absolute;
		top: 5px;
		right: 5px;
		cursor: pointer;
	}

	.login-box.password .icon {
		background-image: url(../assets/login/qrcode.png);
	}

	.login-box.qrcode .icon {
		background-image: url(../assets/login/password.png);
	}

	.login-box .form-block {
		margin-top: 24px;
		margin-bottom: 0px;
	}

	.login-box .form-block input {
		height: 38px;
		line-height: 1.3;
		line-height: 38px\9;
		border-width: 1px;
		border-style: solid;
		background-color: #fff;
		border-radius: 2px;
		display: block;
		width: 100%;
		padding-left: 10px;
		border-color: #e6e6e6;
		outline: 0;
		-webkit-appearance: none;
		transition: all .3s;
		-webkit-transition: all .3s;
		box-sizing: border-box;
		font-family: inherit;
		font-size: inherit;
		font-style: inherit;
		font-weight: inherit;
	}

	.login-box .form-block button {
		width: 100%;
		background: #e63d2d;
		display: inline-block;
		height: 38px;
		line-height: 38px;
		padding: 0 18px;
		color: #fff;
		white-space: nowrap;
		text-align: center;
		font-size: 14px;
		border: none;
		border-radius: 2px;
		cursor: pointer;
		outline: none;
	}

	.login-box .qrcode-box {
		margin-top: 24px;
	}

	.login-box .qrcode-box img {
		height: 180px;
		width: 180px;
		display: block;
		margin: 0 auto
	}

	.login-box .qrcode-desc {
		margin: 24px auto 0px;
		width: 188px;
	}

	.login .qrcode-desc p {
		height: 20px;
		line-height: 20px;
	}

	.login-box .qrcode-desc p a {
		color: #f40;
		padding: 0px 4px;
	}

	.login .bottom .row {
		display: flex;
		text-align: center;
	}

	.login .bottom .row .col {
		width: 25%;
	}

	.login .bottom .row .col h4 {
		color: #75c2d2;
		font-size: 16px;
		margin-bottom: 10px;
	}

	.login .bottom .row .col p {
		font-size: 12px;
		color: #bababa;
	}

	.login .bottom .link {
		padding: 8px 0px;
		margin: 8px 0px;
		border-top: 1px solid #cccccc;
		border-bottom: 1px solid #cccccc;
		display: flex;
	}

	.login .bottom .link a {
		display: block;
		white-space: nowrap;
		color: #6c6c6c;
		padding: 0px 8px;
		position: relative;
		height: 20px;
		line-height: 20px;
	}

	.login .bottom .link a:before {
		content: '';
		width: 1px;
		height: 16px;
		background: #6c6c6c;
		display: inline-block;
		position: absolute;
		left: 0px;
		top: 2px;
	}

	.login .bottom .link a:first-child:before {
		width: 0px;
	}
</style>

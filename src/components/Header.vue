<template>
	<div class="full">
		<div class="header">
			<div class="logo">
				<img src="../assets/index/logo.png" />
			</div>
			<ul class="tools">
				<li @click="shrink()"><i class="iconfont icon-shrink"></i></li>
				<li><i class="iconfont icon-refresh"></i></li>
			</ul>
			<div class="user">
				<ul>
					<li>
						<a href="javascript:;">
							<span>系统管理员</span>
							<i class="iconfont icon-dropdown"></i>
						</a>
						<dl class="child">
							<dd>基本资料</dd>
							<dd>修改密码</dd>
							<dd v-on:click="logout">退出</dd>
						</dl>
					</li>
					<li>
						<a href="javascript:;">
							<i class="iconfont icon-more"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</template>

<script>
	import menu from '../router/router';
	export default {
		data() {
			return {}
		},
		created() {
			this.navBar = menu;
		},
		methods: {
			shrink() {
				this.$emit('shrink')
			},
			logout() {
				var that = this;
				that.$Modal.confirm({
					title: '提示',
					content: '确定要退出系统吗',
					onOk: function() {
						that.$store.commit('login', false)
						sessionStorage.removeItem('isLogin');
						that.$router.replace({
							name: 'login'
						})
					}
				})
			},
		}
	}
</script>

<style>
	.ivu-layout-header {
		height: auto;
		padding: 0px;
		background: transparent;
		line-height: 50px;
	}

	.header {
		height: 50px;
		width: 100%;
		position: relative;
		background: #393D49 -webkit-gradient(linear, right top, left top, from(#393D49), to(#393D49));
		background: #393D49 -webkit-linear-gradient(right, #393D49 0, #393D49 100%);
		background: #393D49 -o-linear-gradient(right, #393D49 0, #393D49 100%);
		background: #393D49 linear-gradient(-90deg, #393D49 0, #393D49 100%);
		background-color: #393D49;
		border-top-color: #393D49;
		border-bottom-color: #e9f2fb;
		padding-left: 220px;
	}

	.header .logo {
		background: #20222A;
		width: 220px;
		height: 100%;
		position: absolute;
		padding: 5px;
		box-sizing: border-box;
		left: 0px;
		top: 0px;
	}

	.header .logo img {
		display: block;
		margin: 0 auto;
		max-height: 36px;
		max-width: 168px;
	}

	.header .tools {
		padding-left: 10px;
		display: flex;
	}

	.header .tools li {
		padding: 0px 10px;
		color: rgba(255, 255, 255, .7);
	}

	.header .tools li.avtive {
		color: rgba(255, 255, 255, 1);
	}

	.header .user {
		position: absolute;
		right: 0px;
		top: 0px;
	}

	.header .user li {
		display: inline-block;
		line-height: 50px;
		height: 50px;
		position: relative;
	}

	.header .user a {
		display: inline-block;
		padding: 0px 15px;
		height: 50px;
		position: relative;
		color: rgba(255, 255, 255, .7);
	}

	.header .user a+dl.child {
		display: none;
		position: absolute;
		z-index: 100;
		background: white;
		width: 100%;
		border: 1px solid #d2d2d2;
		border-top: none;
		box-shadow: 0 2px 4px rgba(0, 0, 0, .12);
		line-height: 36px;
		white-space: nowrap;
		text-align: center;
		-webkit-animation-duration: .5s;
		animation-duration: .5s;
		-webkit-animation-fill-mode: both;
		animation-fill-mode: both;
		transition: all 500ms;
	}

	.header .user a+dl.child dd {
		cursor: pointer;
	}

	.header .user a+dl.child dd:hover {
		color: #777777;
	}

	.header .user a i.icon-dropdown {
		position: absolute;
		right: 0px;
		top: 0px;
		transition: all 500ms;
	}

	.header .user a:hover i.icon-dropdown {
		transform: rotate(180deg);
	}

	.header .user li:hover a+.child {
		display: block;
	}

	.sub-nav {
		width: 100%;
		height: 50px;
		padding: 5px 10px;
		box-sizing: border-box;
		display: flex;
	}

	.sub-nav li {
		height: 40px;
		line-height: 40px;
		padding: 0px 12px;
		display: block;
		position: relative;
	}

	.sub-nav li:after {
		content: '';
		display: block;
		width: 2px;
		height: 20px;
		margin: 9px 0px;
		padding: 0px;
		background-color: rgba(0, 0, 0, .05);
		position: absolute;
		top: 0px;
		right: 0px;
	}

	.sub-nav li:last-child:after {
		width: 0px;
	}

	.sub-nav li:hover a,
	.sub-nav li.active a {
		font-weight: 700;
		cursor: pointer;
	}

	.sub-nav li.active a {
		color: #0c64eb;
	}
</style>

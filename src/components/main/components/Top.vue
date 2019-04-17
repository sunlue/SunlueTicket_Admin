<template>
	<Header>
		<div class="logo"><img src="../../../assets/index/logo.png" /></div>
		<ul class="tools">
			<li @click="shrink()">
				<Tooltip content="展开/收缩" placement="bottom-start"><i class="iconfont icon-shrink"></i></Tooltip>
			</li>
			<li @click="bigdata()">
				<Tooltip content="可视化" placement="bottom-start"><i class="iconfont icon-bigdata"></i></Tooltip>
			</li>
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
					<a href="javascript:;"><i class="iconfont icon-more"></i></a>
				</li>
			</ul>
		</div>
	</Header>
</template>

<script>
import menu from '@/router/router';
export default {
	data() {
		return {};
	},
	created() {
		this.navBar = menu;
	},
	methods: {
		shrink() {
			this.$emit('shrink');
		},
		bigdata() {
			let { href } = this.$router.resolve({
				name: 'views'
			});
			window.open(href);
		},
		logout() {
			var that = this;
			that.$Modal.confirm({
				title: '提示',
				content: '确定要退出系统吗',
				onOk: function() {
					that.$store.commit('login', false);
					sessionStorage.removeItem('isLogin');
					that.$router.replace({
						name: 'login'
					});
				}
			});
		}
	}
};
</script>

<style></style>

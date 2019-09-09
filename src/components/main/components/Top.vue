<template>
	<Header>
		<div class="logo"><img src="../../../assets/index/logo.png" /></div>
		<ul class="tools">
			<li @click="shrink()">
				<Tooltip content="展开/收缩" placement="bottom-start"><i class="iconfont icon-shrink"></i></Tooltip>
			</li>
			<li @click="bigdata()" v-if="false">
				<Tooltip content="可视化" placement="bottom-start"><i class="iconfont icon-bigdata"></i></Tooltip>
			</li>
		</ul>
		<div class="right">
			<Dropdown @on-click="userAction">
				<a href="javascript:void(0)">
					您好！{{userInfo.name || userInfo.account}}
					<Icon :size="18" type="md-arrow-dropdown" />
				</a>
				<DropdownMenu slot="list">
					<DropdownItem name="edit_password" v-if="false">修改密码</DropdownItem>
					<DropdownItem name="logout" divided>退出登录</DropdownItem>
				</DropdownMenu>
			</Dropdown>
		</div>
	</Header>
</template>

<script>
export default {
	data() {
		let that=this;
		return {
			userInfo:that.$store.getters.userInfo
		};
	},
	methods: {
		shrink() {
			this.$emit('shrink');
		},
		userAction(name) {
			this[name]();
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

<template>
	<div class="left-menu">
		<Menu ref='menu' :active-name="activeMenu" theme="dark" width="auto" :class="classs" :open-names="openMenu">
			<MenuItem name="main" :to="{name:'main'}">
			<Icon type="ios-navigate"></Icon>
			<span>控制台</span>
			</MenuItem>
			<Submenu :name="nav.name" v-for="(nav,index) in menu" :key="index">
				<template slot="title">
					<Icon type="ios-navigate"></Icon>
					<span>{{nav.meta.title}}</span>
				</template>
				<template v-if="nav.children">
					<MenuItem :name="menu.name" v-for="(menu,j) in nav.children" :key="j" :to="{name:menu.name}">
					<span>{{menu.meta.title}}</span>
					</MenuItem>
				</template>
			</Submenu>
		</Menu>
	</div>
</template>
<script>
	import menu from '../router/router.js'
	export default {
		data() {
			return {
				menu: menu,
				isCollapsed: true,
				openMenu: [],
				activeMenu: 'main'
			}
		},
		created() {
			this.$nextTick(function() {
				this.$refs.menu.updateOpened();
				this.$refs.menu.updateActiveName();
			})
		},
		computed: {
			classs() {
				return [
					!this.isCollapsed ? 'close' : 'open'
				];
			},
		},
		methods: {
			shrink(state) {
				this.isCollapsed = state;
			},
			currRoute(route) {
				route.find((item) => {
					this.openMenu.push(item.name)
				})
				this.activeMenu = this.$route.name
			}
		}
	}
</script>

<style>
	.ivu-layout-sider {
		height: 100% !important;
		overflow: hidden !important;
	}

	.left-menu {
		width: calc(100% + 17px);
		height: 100%;
		overflow-y: scroll;
	}

	.close span {
		transition: all .2s ease;
		display: none;
	}

	.close i {
		transform: translateX(5px);
		transition: font-size .2s ease .2s, transform .2s ease .2s;
		vertical-align: middle;
		font-size: 22px;
	}

	.close .ivu-icon-ios-arrow-down {
		transition: all .2s ease;
		display: none;
	}
</style>

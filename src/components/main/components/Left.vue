<template>
	<Sider ref="sider" width="220" hide-trigger :collapsible="true" v-model="flag" :collapsed-width="78">
		<div class="left-menu">
			<Menu ref="menu" :active-name="activeMenu" theme="dark" width="auto" :class="classs" :open-names="openMenu">
				<MenuItem name="main" :to="{ name: 'main' }">
					<Icon type="ios-navigate"></Icon>
					<span>控制台</span>
				</MenuItem>
				<Submenu :name="nav.name" v-for="(nav, index) in menu" :key="index">
					<template slot="title" v-if="nav.meta">
						<Icon type="ios-navigate"></Icon>
						<span>{{ nav.meta.title }}</span>
					</template>
					<template v-if="nav.children">
						<MenuItem :name="menu.name" v-for="(menu, j) in nav.children" :key="j" :to="{ name: menu.name }">
							<span>{{ menu.meta.title }}</span>
						</MenuItem>
					</template>
				</Submenu>
			</Menu>
		</div>
	</Sider>
</template>
<script>
export default {
	data() {
		return {
			flag: false,
			isCollapsed: true,
			openMenu: [],
			activeMenu: 'main'
		};
	},
	props: {
		menu: {
			type: Array,
			default: ()=>{
				return new Array();
			}
		}
	},
	created() {
		this.$nextTick(function() {
			this.$refs.menu.updateOpened();
			this.$refs.menu.updateActiveName();
		});
	},
	computed: {
		classs() {
			return [!this.isCollapsed ? 'close' : 'open'];
		}
	},
	methods: {
		shrink() {
			this.isCollapsed = this.flag;
			this.$refs.sider.toggleCollapse();
		},
		currRoute(route) {
			route.find(item => {
				this.openMenu.push(item.name);
			});
			this.activeMenu = this.$route.name;
		}
	}
};
</script>

<template>
	<Sider ref="sider" width="220" hide-trigger :collapsible="true" v-model="flag" :collapsed-width="78" breakpoint="xs">
		<div class="left-menu">
			<Menu ref="menu" :active-name="activeMenu" theme="dark" width="auto" :accordion="true" 
			:class="classs" :open-names="openMenu"  @on-select="selectMenu" @on-open-change="openMenuChange">
				<MenuItem name="main" :to="{ name: 'main' }">
					<Icon type="ios-navigate"></Icon>
					<span class="nav">控制台</span>
				</MenuItem>
				<Submenu :name="nav.name" v-for="(nav, index) in navMenu" :key="index">
					<template slot="title" v-if="nav.meta">
						<Icon type="ios-navigate"></Icon>
						<span class="nav">{{ nav.meta.title }}</span>
					</template>
					<template v-if="nav.children">
						<MenuItem :name="menu.name" v-for="(menu, j) in nav.children" :key="j" :to="{ name: menu.name }">
							<span class="nav">{{ menu.meta.title }}</span>
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
			let that=this;
			return {
				flag: false,
				isCollapsed: true,
				navMenu:[],
				activeMenu: that.$route.name
			};
		},
		created() {
			this.$store.dispatch('getMenu').then(data => {
				this.navMenu = data;
				this.$nextTick(function() {
					this.$refs.menu.updateActiveName();
					this.$refs.menu.updateOpened();
				});
			});
		},
		computed: {
			classs() {
				return [!this.isCollapsed ? 'close' : 'open'];
			},
			openMenu(){
				return this.$route.matched.map(item => item.name).filter(item => item !== name);
			}
		},
		methods: {
			shrink() {
				this.isCollapsed = this.flag;
				this.$refs.sider.toggleCollapse();
			},
			selectMenu(){
				this.flag=false;
				this.isCollapsed='open'
			},
			openMenuChange(){
				this.flag=false;
				this.isCollapsed='open'
			}
		}
	};
</script>

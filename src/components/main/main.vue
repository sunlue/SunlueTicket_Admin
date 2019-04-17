<template>
	<Layout class="main">
		<Top ref="top" @shrink="shrink"></Top>
		<Layout class="ivu-layout-has-sider">
			<Left ref="left" :menu="menu"></Left>
			<Content><router-view /></Content>
		</Layout>
		<Bottom ref="bottom" @currPage="currRoute">footer</Bottom>
	</Layout>
</template>
<script>
import './main.less';
import Top from './components/Top.vue';
import Left from './components/Left.vue';
import Bottom from './components/Bottom.vue';
export default {
	components: {
		Top,
		Bottom,
		Left
	},
	data() {
		return {
			menu: []
		};
	},
	mounted() {
		this.$store.dispatch('getMenu').then((data)=>{
			this.menu =data;
		})
	},
	methods: {
		shrink() {
			this.$refs.left.shrink();
		},
		currRoute(curr) {
			this.$refs.left.currRoute(curr);
		}
	}
};
</script>

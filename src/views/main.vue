<template>
	<div>
		<Header>
			<Top @shrink="shrink"></Top>
		</Header>
		<Layout>
			<Sider ref="sider" width="220" hide-trigger :collapsible="true" v-model="flag" :collapsed-width="78">
				<Left ref="left"></Left>
			</Sider>
			<Content>
				<Main></Main>
			</Content>
		</Layout>
		<Footer>
			<Bottom @currRoute="currRoute">footer</Bottom>
		</Footer>
	</div>
</template>

<script>
	import Top from '../components/Header.vue';
	import Left from '../components/Left.vue';
	import Main from '../components/Main.vue';
	import Bottom from '../components/Bottom.vue';
	export default {
		components: {
			Top,
			Left,
			Main,
			Bottom
		},
		data() {
			return {
				flag: false
			}
		},
		methods: {
			shrink() {
				this.$refs.left.shrink(this.flag);
				this.$refs.sider.toggleCollapse();
			},
			currRoute(curr) {
				this.$refs.left.currRoute(curr);
			}
		}
	}
</script>

<style>
	.ivu-layout {
		height: calc(100vh - 100px);
		height: -webkit-calc(100vh - 100px);
		height: -moz-calc(100vh - 100px);
		position: relative;
	}
</style>

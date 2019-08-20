<template>
	<Layout class="main">
		<Top ref="top" @shrink="shrink"></Top>
		<Layout class="ivu-layout-has-sider">
			<Left ref="left"></Left>
			<Content><router-view /></Content>
		</Layout>
		<Bottom ref="bottom">footer</Bottom>
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
		Left,
		Bottom
	},
	methods: {
		shrink() {
			this.$refs.left.shrink();
		}
	}
};
</script>

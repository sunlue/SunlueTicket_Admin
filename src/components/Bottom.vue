<template>
	<div class="ivu-layout-footer">
		<Breadcrumb>
			<BreadcrumbItem v-for="(c,i) in curr" :key="i">{{c.title}}</BreadcrumbItem>
		</Breadcrumb>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				curr: []
			}
		},
		watch: {
			$route() {
				this.breadInit()
			}
		},
		created() {
			this.breadInit()
		},
		methods: {
			breadInit(){
				this.curr=new Array();
				var currRoute = '';
				var currName = this.$route.name;
				var router = this.$route.matched;
				router.find(function(item) {
					if (item.name == currName) {
						currRoute = item;
					}
				})
				this.breadcrumb(currRoute);
				this.curr = this.curr.reverse();
				this.$emit('currRoute',this.curr);
			},
			breadcrumb(route) {
				this.curr.push({
					name: route.name,
					title: route.meta.title
				})
				if (route.parent) {
					this.breadcrumb(route.parent)
				}
			},
		}
	}
</script>

<style>
	.ivu-layout-footer {
		background: #393D49 -webkit-gradient(linear, right top, left top, from(#393D49), to(#393D49));
		background: #393D49 -webkit-linear-gradient(right, #393D49 0, #393D49 100%);
		background: #393D49 -o-linear-gradient(right, #393D49 0, #393D49 100%);
		background: #393D49 linear-gradient(-90deg, #393D49 0, #393D49 100%);
		background-color: #393D49;
		border-top-color: #393D49;
		border-bottom-color: #e9f2fb;
		padding: 0px;
		color: #FFFFFF;
		font-size: 14px;
		height: 50px;
		line-height: 50px;
		padding: 0px 10px;
	}

	.ivu-breadcrumb a,
	.ivu-breadcrumb span {
		color: white;
	}
</style>

<template>
	<Footer>
		<Breadcrumb>
			<BreadcrumbItem v-for="(c,i) in curr" :key="i">{{c.title}}</BreadcrumbItem>
		</Breadcrumb>
	</Footer>
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
				this.$emit('currPage',this.curr);
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

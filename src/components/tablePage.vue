<template>
	<div>
		<Page :total="total" :page-size="pageSize" :current="page" show-total show-elevator show-sizer :class-name="className" size="small" @on-change="jump" @on-page-size-change="pageJump" />
	</div>
</template>

<script>
	export default {
		props: ['total', 'pageSize', 'page'],
		data() {
			return {
				className: 'sunlue-pages'
			}
		},
		methods: {
			jump(pageNumber) {
				this.$emit('jump', {
					pageNumber: pageNumber
				})
			},
			pageJump(pageSize) {
				this.$emit('pageSizeJump', {
					pageSize: pageSize
				})
			}
		}
	}
</script>

<style>
	.sunlue-pages {
		box-sizing: border-box;
		position: relative;
	}

	.sunlue-pages .ivu-page-total {
		position: absolute;
		right: 0px;
		top: 50%;
		transform: translateY(-50%);
	}
</style>

<template>
	<div>
		<Table border :columns="columns" :data="data" size="small">
			<template slot-scope="{ row, index }" slot="action">
				<Button type="primary" size="small" @click="check(row,index)" v-if="(row.is_check!='yes')">验票</Button>
				<Button type="error" size="small" @click="refund(row,index)" v-if="(row.is_check!='yes')">退票</Button>
			</template>
			<tablePage slot="footer" :total="total" :pageSize="limit" :page="page" v-if="(page>0)" @jump="jump" @pageSizeJump="pageSizeJump"></tablePage>
		</Table>
	</div>
</template>

<script>
	import tablePage from '../../../components/tablePage.vue';
	export default {
		components: {
			tablePage
		},
		props: ['data', 'total', 'page', 'limit', 'modal'],
		data() {
			return {
				columns: [{
					"title": "票务标识",
					"key": "uniqid",
					"width": 120
				}, {
					"title": "票务名称",
					"key": "name",
					"minWidth": 120,
					"fixed": (this.modal ? 'left' : '')
				}, {
					"title": "是否验票",
					"width": 86,
					"align": "center",
					render: (h, params) => {
						return h('div', params.row.is_check == 'yes' ? '已使用' : '未使用');
					}
				}, {
					"title": "验票时间",
					"key": "check_time",
					"sortable": true,
					"width": 106
				}, {
					"title": "票务价格",
					"key": "price",
					"sortable": true,
					"width": 106
				}, {
					"title": "使用日期",
					"key": "use_date",
					"width": 100
				}, {
					"title": "支付金额",
					"key": "pay_money",
					"sortable": true,
					"width": 106
				}, {
					"title": "支付方式",
					"key": "pay_type",
					"width": 86
				}, {
					"title": "支付时间",
					"key": "pay_time",
					"sortable": true,
					"width": 152
				}, {
					"title": "支付流水号",
					"key": "pay_sn",
					"minWidth": 120
				}, {
					"title": "备注",
					"key": "note",
					"minWidth": 80,
				}, {
					"title": "状态",
					"width": 72,
					"key": "status",
					"align": "center",
					"fixed": (this.modal ? 'right' : '')
				}, {
					"slot": 'action',
					"width": 76,
					"fixed": (this.modal ? 'right' : '')
				}],
			}
		},
		methods: {
			check(row, index) {
				this.$emit('check', {
					row: row,
					index: index
				})
			},
			refund(row, index) {
				this.$emit('check', {
					row: row,
					index: index
				})
			},
			jump(pageNumber) {
				this.$emit('jump', pageNumber)
			},
			pageSizeJump(pageSize) {
				this.$emit('pageSizeJump', pageSize)
			}
		}
	}
</script>

<style>
</style>

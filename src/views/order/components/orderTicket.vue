<template>
	<div>
		<Table border :columns="columns" :data="data" size="small">
			<template slot-scope="{ row, index }" slot="action">
				<div v-if="row.state == 1">
					<Button type="primary" size="small" @click="check(row, index)" v-if="row.is_check != 'yes'">验票</Button>
					<Button type="error" size="small" @click="refund(row, index)" v-if="row.is_check != 'yes'">退票</Button>
				</div>
				<Button type="error" size="small" @click="refund(row, index)" v-if="row.state == 3">退款</Button>
				<Button type="error" size="small" @click="refund(row, index)" v-if="row.state == 4">查看</Button>
				<div v-if="row.state == 5">已完成</div>
			</template>
			<tablePage slot="footer" :total="total" :pageSize="limit" :page="page" v-if="page > 0" @jump="jump" @pageSizeJump="pageSizeJump"></tablePage>
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
			columns: [
				{
					title: '票务标识',
					key: 'uniqid',
					width: 120
				},
				{
					title: '票务名称',
					minWidth: 120,
					fixed: this.modal ? 'left' : '',
					render: (h, params) => {
						return h('span', {}, params.row.ticket.name);
					}
				},
				{
					title: '是否验票',
					width: 86,
					align: 'center',
					render: (h, params) => {
						return h('div', params.row.is_check == 'yes' ? '已使用' : '未使用');
					}
				},
				{
					title: '验票时间',
					key: 'check_time',
					sortable: true,
					width: 106
				},
				{
					title: '票务价格',
					key: 'use_price',
					sortable: true,
					width: 106
				},
				{
					title: '使用日期',
					key: 'use_date',
					width: 100
				},
				{
					title: '支付金额',
					key: 'pay_money',
					sortable: true,
					width: 106
				},
				{
					title: '支付方式',
					key: 'pay_type',
					width: 86
				},
				{
					title: '支付时间',
					key: 'pay_time',
					sortable: true,
					width: 152
				},
				{
					title: '支付流水号',
					key: 'pay_sn',
					minWidth: 120
				},
				{
					title: '备注',
					key: 'note',
					minWidth: 80
				},
				{
					title: '状态',
					width: 80,
					key: 'status',
					align: 'center',
					fixed: this.modal ? 'right' : ''
				},
				{
					slot: 'action',
					width: 76,
					fixed: this.modal ? 'right' : ''
				}
			]
		};
	},
	methods: {
		check(row, index) {
			this.$emit('check', {
				row: row,
				index: index
			});
		},
		refund(row, index) {
			this.$emit('check', {
				row: row,
				index: index
			});
		},
		jump(pageNumber) {
			this.$emit('jump', pageNumber);
		},
		pageSizeJump(pageSize) {
			this.$emit('pageSizeJump', pageSize);
		}
	}
};
</script>

<style></style>

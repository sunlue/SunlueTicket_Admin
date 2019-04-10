import main from '@/components/Main.vue'
export const router = [{
	path: '/ticket',
	name: 'ticket_index',
	component: main,
	meta: {
		title: '票务管理',
		is_login: true
	},
	children: [{
		path: 'list',
		name: 'ticket_list',
		component: () => import('@/views/ticket/list.vue'),
		meta: {
			title: '票务列表',
			is_login: true
		},
	}, {
		path: 'price',
		name: 'ticket_price',
		component: () => import('@/views/ticket/price.vue'),
		meta: {
			title: '票务价格',
			is_login: true
		},
	}, {
		path: 'setting',
		name: 'ticket_setting',
		component: () => import('@/views/ticket/setting.vue'),
		meta: {
			title: '票务设置',
			is_login: true
		},
	}]
}, {
	path: '/pay',
	name: 'pay_index',
	component: main,
	meta: {
		title: '支付管理',
		is_login: true
	},
	children: [{
		path: 'weixin',
		name: 'pay_weixin',
		component: () => import('@/views/pay/weixin.vue'),
		meta: {
			title: '微信支付',
			is_login: true
		},
	}, {
		path: 'alipay',
		name: 'pay_alipay',
		component: () => import('@/views/pay/alipay.vue'),
		meta: {
			title: '支付宝',
			is_login: true
		},
	}]
}, {
	path: '/order',
	name: 'order_index',
	component: main,
	meta: {
		title: '票务订单',
		is_login: true
	},
	children: [{
		path: 'list',
		name: 'order_list',
		component: () => import('@/views/order/list.vue'),
		meta: {
			title: '订单列表',
			is_login: true
		},
	}, {
		path: 'refund',
		name: 'order_refund',
		component: () => import('@/views/order/refund.vue'),
		meta: {
			title: '订单退款',
			is_login: true
		},
	}]
}, {
	path: '/config',
	name: 'config_index',
	component: main,
	meta: {
		title: '系统设置',
		is_login: true
	},
	children: [{
		path: 'weixin',
		name: 'config_weixin',
		component: () => import('@/views/config/weixin.vue'),
		meta: {
			title: '微信配置',
			is_login: true
		},
	}]
}]
export default router
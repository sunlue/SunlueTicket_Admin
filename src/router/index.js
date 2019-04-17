import routes from './router.js'
export const pages = [{
		path: '/login',
		name: 'login',
		component: () => import('@/views/login.vue')
	}, {
		path: '/',
		redirect: '/main',
		component: () => import('@/components/main'),
		children: [{
			path: '/main',
			name: 'main',
			component: () => import('@/views/index'),
			meta: {
				title: '控制台',
				is_login: true
			},
		}]
	}, {
		path: '/views',
		name: 'views',
		component: () => import('@/views/views'),
		meta: {
			title: '可视化数据',
			is_login: false
		}
	}
]
routes.forEach((route) => {
	pages.unshift(route);
})
export default pages

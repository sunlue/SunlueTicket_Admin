import pages from './router.js'
export const routes = [{
		path: '/',
		redirect: '/login',
	}, {
		path: '/login',
		name: 'login',
		component: () => import('@/views/login.vue')
	}, {
		path: '/main',
		name: 'main',
		component: () => import('@/views/main.vue'),
		children: pages,
		meta:{
			is_login:true,
			title:'控制台'
		}
	},
]
export default routes
import Vue from 'vue'
import Router from 'vue-router'
import iView from 'iview';
import store from './store'
import route from '@/router/index'
Vue.use(Router)
const router = new Router({
	mode: 'history',
	routes: route
})
router.beforeEach((to, from, next) => {
	iView.LoadingBar.start();
	if (to.meta.is_login) {
		var isLogin = sessionStorage.getItem('isLogin');
		if (isLogin) {
			store.state.user.isLogin = true;
			store.state.user.token = store.getters.token;
			next();
		} else {
			next({
				name: 'login'
			})
		}
	}
	next();
})
router.afterEach(() => {
    iView.LoadingBar.finish();
});
export default router

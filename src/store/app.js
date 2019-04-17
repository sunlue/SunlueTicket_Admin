import routers from '@/router/router.js'
const app = {
	state: {
		menu: ''
	},
	mutations: {
		SET_MENU(state,data) {
			state.menu = data
		},
	},
	actions:{
		getMenu({commit}){
			return new Promise((resolve, reject) => {
				commit('SET_MENU', routers);
				resolve(routers);
			})
		}
	}
}
export default app;

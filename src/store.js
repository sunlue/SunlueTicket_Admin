import Vue from 'vue'
import Vuex from 'vuex'


import user from '@/store/user'
import ticket from '@/store/ticket'
import pay from '@/store/pay'
import order from '@/store/order'
import config from '@/store/config'

Vue.use(Vuex)

const store = new Vuex.Store({
	modules: {
		user,
		pay,
		ticket,
		order,
		config
	},
	getters: {
		isLogin: state => {
			return state.user.isLogin;
		},
		token: state => {
			return state.user.token ? state.user.token : sessionStorage.getItem('token');
		}
	}
})
export default store;

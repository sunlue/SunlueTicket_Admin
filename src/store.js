import Vue from 'vue'
import Vuex from 'vuex'

import app from '@/store/app'
import user from '@/store/module/user'
import ticket from '@/store/module/ticket'
import pay from '@/store/module/pay'
import order from '@/store/module/order'
import config from '@/store/module/config'

Vue.use(Vuex)

const store = new Vuex.Store({
	modules: {
		app,
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
		},
		menu: state => {
			return state.app.menu;
		}
	}
})
export default store;

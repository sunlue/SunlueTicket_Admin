import config from '@/api/pay/config'
export default {
	state: {
		PAY_CONFIG: '',
		WEIXIN_CONFIG: '',
		ALIPAY_CONFIG: ''
	},
	mutations: {
		GET_CONFIG(state, data) {
			state.PAY_CONFIG = data;
		},
		WEIXIN_PAY_CONFIG(state, data) {
			state.WEIXIN_CONFIG = data;
		},
		ALIPAY_CONFIG(state, data) {
			state.ALIPAY_CONFIG = data;
		},
	},
	actions: {
		getPayConfig({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				config.get(params).then(response => {
					const data = response.data
					commit('GET_CONFIG', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		setPayConfigWeixin({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				config.weixin(params).then(response => {
					const data = response.data
					commit('WEIXIN_PAY_CONFIG', data)
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		setPayConfigAlipay({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				config.alipay(params).then(response => {
					const data = response.data
					commit('ALIPAY_CONFIG', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		}
	}
}

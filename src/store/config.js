import config from '@/api/config'
const user = {
	state: {
		notRecord: ''
	},
	mutations: {
		SET_NOT_RECORD(state, data) {
			state.notRecord = data
		},
	},
	actions: {
		setSysConfig({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				config.set(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getSysConfig({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				config.get(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		}
	}
}
export default user;

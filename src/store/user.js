import login from '@/api/login'
const user = {
	state: {
		token: '',
		isLogin: false
	},
	mutations: {
		login: (state, data) => {
			state.isLogin = data
		},
		SET_TOKEN: (state, token) => {
			state.token = token
		}
	},
	actions: {
		login({
			commit
		}, userInfo) {
			return new Promise((resolve, reject) => {
				login.account(userInfo).then(response => {
					const data = response.data
					commit('login', true);
					commit('SET_TOKEN', data.token);
					sessionStorage.setItem('isLogin', true);
					sessionStorage.setItem('token', data.token);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		}
	}
}
export default user;

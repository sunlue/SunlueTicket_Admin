import login from '@/api/login'
const user = {
	state: {
		token: '',
		isLogin: false,
		userInfo: {}
	},
	mutations: {
		login: (state, data) => {
			state.isLogin = data
		},
		SET_TOKEN: (state, token) => {
			state.token = token
		},
		SET_USER_INFO: (state, data) => {
			state.userInfo = data
		},
		REFRESH_LOGIN: (state) => {
			let token = sessionStorage.getItem('token');
			let userInfo = sessionStorage.getItem('userInfo');
			state.isLogin = true;
			state.token = token;
			state.userInfo = JSON.parse(userInfo);
		}
	},
	getters: {
		userInfo: state => {
			return state.userInfo;
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
					commit('SET_USER_INFO', data.userInfo);
					sessionStorage.setItem('isLogin', true);
					sessionStorage.setItem('token', data.token);
					sessionStorage.setItem('userInfo', JSON.stringify(data.userInfo));
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		}
	}
}
export default user;

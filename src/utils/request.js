import axios from 'axios'
import store from '@/store'
import iView from 'iview'
// 创建一个axios请求
const service = axios.create({
	baseURL: process.env.BASE_URL, // api 的 base_url
	timeout: 5000 // 超时时间
})

// 请求拦截
service.interceptors.request.use(
	config => {
		config.headers['auth-token'] = store.getters.token
		config.headers.common['authorization'] = window.location.hostname
		config.onUploadProgress = function() {
			iView.LoadingBar.start();
		}
		return config
	},
	error => {
		iView.Message.error({
			content: error.message,
			duration: 5
		})
		Promise.reject(error)
	}
)

service.interceptors.response.use(
	response => {
		const result = response.data;
		if (result.code !== 0) {
			iView.Message.warning({
				content: result.info,
				duration: 3
			});
			iView.LoadingBar.error();
			return Promise.reject('error')
		} else {
			iView.LoadingBar.finish();
			return result;
		}
	},
	error => {
		iView.Message.error({
			content: error.message,
			duration: 5
		})
		iView.LoadingBar.error();
		return Promise.reject(error)
	}
)

export default service

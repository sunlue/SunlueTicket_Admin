import request from '@/utils/request'

const Login = function() {}
Login.prototype.account = function(userInfo) {
	return request({
		url: 'user/login',
		method: 'post',
		data: userInfo
	})
}
export default new Login();

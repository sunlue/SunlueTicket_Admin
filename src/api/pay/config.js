import request from '@/utils/request'
const Config = function() {}
Config.prototype.get = function(params) {
	return request({
		url: 'pay/config/get',
		method: 'post',
		data: params
	})
}
Config.prototype.weixin = function(params) {
	return request({
		url: 'pay/config/weixin',
		method: 'post',
		data: params
	})
}
Config.prototype.alipay = function(params) {
	return request({
		url: 'pay/config/alipay',
		method: 'post',
		data: params
	})
}
export default new Config();

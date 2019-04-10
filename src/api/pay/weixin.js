import request from '@/utils/request'
const Weixin = function() {}
Weixin.prototype.get = function(params) {
	return request({
		url: 'ticket/price/get',
		method: 'post',
		data: params
	})
}
export default new Weixin();

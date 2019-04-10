import request from '@/utils/request'
const Price = function() {}
Price.prototype.get = function(params) {
	return request({
		url: 'ticket/price/get',
		method: 'post',
		data: params
	})
}
Price.prototype.set = function(params) {
	return request({
		url: 'ticket/price/set',
		method: 'post',
		data: params
	})
}
export default new Price();

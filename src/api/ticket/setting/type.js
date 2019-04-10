import request from '@/utils/request'
const Type = function() {}
Type.prototype.get = function(params, ticket) {
	if (ticket == true) {
		return request({
			url: 'ticket/setting/type/ticket',
			method: 'post',
			data: params
		})
	}
	return request({
		url: 'ticket/setting/type/get',
		method: 'post',
		data: params
	})
}

Type.prototype.set = function(params) {
	return request({
		url: 'ticket/setting/type/set',
		method: 'post',
		data: params
	})
}
Type.prototype.enable = function(params) {
	return request({
		url: 'ticket/setting/type/enable',
		method: 'post',
		data: params
	})
}
Type.prototype.remove = function(params) {
	return request({
		url: 'ticket/setting/type/remove',
		method: 'post',
		data: params
	})
}
export default new Type();

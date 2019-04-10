import request from '@/utils/request'
const List = function() {}
List.prototype.get = function(params) {
	return request({
		url: 'ticket/list/get',
		method: 'post',
		data: params
	})
}
List.prototype.set = function(params) {
	return request({
		url: 'ticket/list/set',
		method: 'post',
		data: params
	})
}
List.prototype.attr = function(params) {
	return request({
		url: 'ticket/list/attr',
		method: 'post',
		data: params
	})
}
List.prototype.remove = function(params) {
	return request({
		url: 'ticket/list/remove',
		method: 'post',
		data: params
	})
}
List.prototype.edit = function(params) {
	return request({
		url: 'ticket/list/edit',
		method: 'post',
		data: params
	})
}

List.prototype.price = function(params) {
	return request({
		url: 'ticket/list/price',
		method: 'post',
		data: params
	})
}
export default new List();

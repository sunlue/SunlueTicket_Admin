import request from '@/utils/request'

const List = function() {}
List.prototype.get = function(userInfo) {
	return request({
		url: 'order/get',
		method: 'post',
		data: userInfo
	})
}

List.prototype.cancel = function(userInfo) {
	return request({
		url: 'order/cancel',
		method: 'post',
		data: userInfo
	})
}

List.prototype.remove = function(userInfo) {
	return request({
		url: 'order/remove',
		method: 'post',
		data: userInfo
	})
}

export default new List();
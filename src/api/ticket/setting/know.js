import request from '@/utils/request'
const Konw = function() {}
Konw.prototype.all = function(params) {
	return request({
		url: 'ticket/setting/know/all',
		method: 'post',
		data: params
	})
}

Konw.prototype.get = function(params) {
	return request({
		url: 'ticket/setting/know/get',
		method: 'post',
		data: params
	})
}

Konw.prototype.set = function(params) {
	return request({
		url: 'ticket/setting/know/set',
		method: 'post',
		data: params
	})
}

Konw.prototype.edit = function(params) {
	return request({
		url: 'ticket/setting/know/edit',
		method: 'post',
		data: params
	})
}

Konw.prototype.remove = function(params) {
	return request({
		url: 'ticket/setting/know/remove',
		method: 'post',
		data: params
	})
}
export default new Konw();

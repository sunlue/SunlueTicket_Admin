import request from '@/utils/request'

const Index = function() {}
Index.prototype.set = function(params) {
	return request({
		url: 'config/set',
		method: 'post',
		data: params
	})
}
Index.prototype.get = function(params) {
	return request({
		url: 'config/get',
		method: 'post',
		data: params
	})
}
export default new Index();

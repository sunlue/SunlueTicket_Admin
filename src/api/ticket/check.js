import request from '@/utils/request'
const Check = function() {}
Check.prototype.check = function(params) {
	return request({
		url: 'ticket/check',
		method: 'post',
		data: params
	})
}
export default new Check();

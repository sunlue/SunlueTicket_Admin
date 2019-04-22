import request from '@/utils/request'

const analyze = function() {}
analyze.prototype.basis = function(userInfo) {
	return request({
		url: 'analyze/basis',
		method: 'post',
		data: userInfo
	})
}
export default new analyze();

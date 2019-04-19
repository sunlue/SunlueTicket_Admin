import request from '@/utils/request'
import option from './option.js';

const unified = function() {}
unified.prototype.get = function(type) {
	return new Promise((resolve, reject) => {
		request({
			url: 'analyze/order/unified',
			method: 'post',
		}).then(response => {
			resolve(option.line(response.data));
		}).catch(error => {
			reject(error)
		})
	})
}

export default new unified();

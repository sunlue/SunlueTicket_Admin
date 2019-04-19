import request from '@/utils/request'
import option from './option.js';

const traffic = function() {}
traffic.prototype.get = function(type) {
	return new Promise((resolve, reject) => {
		request({
			url: 'analyze/access/traffic',
			method: 'post',
		}).then(response => {
			resolve(option.line(response.data));
		}).catch(error => {
			reject(error)
		})
	})
}

export default new traffic();

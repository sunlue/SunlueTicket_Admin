import request from '@/utils/request'
import option from './option.js';

const visitor = function() {}
visitor.prototype.get = function(type) {
	return new Promise((resolve, reject) => {
		request({
			url: 'analyze/access/referer',
			method: 'post',
		}).then(response => {
			switch (type) {
				default:
					resolve(option.pie(response.data));
					break;
			}
		}).catch(error => {
			reject(error)
		})
	})
}

export default new visitor();

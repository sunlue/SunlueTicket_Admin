import request from '@/utils/request'
import option from './option.js';

const visitor = function() {}
visitor.prototype.get = function(type) {
	return new Promise((resolve, reject) => {
		request({
			url: 'analyze/access/visitor',
			method: 'post',
		}).then(response => {
			switch (type) {
				case 'bar':
					resolve(option.bar(response.data));
					break;
				default:
					resolve(option.line(response.data));
					break;
			}
		}).catch(error => {
			reject(error)
		})
	})
}

export default new visitor();

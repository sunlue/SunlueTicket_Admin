import request from '@/utils/request'
import option from './option.js';

const ticket = function() {}
ticket.prototype.get = function(type) {
	return new Promise((resolve, reject) => {
		request({
			url: 'analyze/ticket/generate',
			method: 'post',
		}).then((response) => {
			resolve(option.pie(response.data));
		}).catch(error => {
			reject(error)
		})
	})
}

export default new ticket();

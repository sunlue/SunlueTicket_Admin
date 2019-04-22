import request from '@/utils/request'
import option from './option.js';


const salas = function() {}
salas.prototype.get = function(type) {
	return new Promise((resolve, reject) => {
		request({
			url: 'analyze/ticket/salas',
			method: 'post',
		}).then(response => {
			resolve(option.bar(response.data));
		}).catch(error => {
			reject(error)
		})
	})
}

export default new salas();

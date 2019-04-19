import request from '@/utils/request'
import option from './option.js';

const map = function() {}
map.prototype.geo = function() {
	return new Promise((resolve, reject) => {
		resolve(option.geo());
	})
}

map.prototype.map = function() {
	return new Promise((resolve, reject) => {
		resolve(option.map());
	})
}

export default new map();

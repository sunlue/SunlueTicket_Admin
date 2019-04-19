import '@/utils/echart'

import map from "./map"
const method = {
	geo: function(type) {
		return new Promise((resolve, reject) => {
			map.geo().then(response => {
				resolve(response);
			}).catch(error => {
				reject(error)
			})
		})
	},
	map: function(type) {
		return new Promise((resolve, reject) => {
			map.map().then(response => {
				resolve(response);
			}).catch(error => {
				reject(error)
			})
		})
	}
}

export default method;

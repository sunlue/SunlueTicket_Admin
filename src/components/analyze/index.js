import 'echarts/lib/chart/bar'
import 'echarts/lib/chart/line'
import 'echarts/lib/chart/pie'

import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/toolbox'
import 'echarts/lib/component/legend'
import 'echarts/lib/component/title'

import 'echarts'

import {
	visitor,
	referer
} from "./access"
const method = {
	access: {
		muster: function(params) {
			return new Promise((resolve, reject) => {
				var dataColum = new Object();
				params.forEach((item) => {
					this[item.total](item.type).then(response => {
						dataColum[item['total']] = response;
					}).catch(error => {
						reject(error)
					})
				})
				resolve(dataColum);
			})
		},
		visitor: function(type) {
			return new Promise((resolve, reject) => {
				visitor.get(type).then(response => {
					resolve(response);
				}).catch(error => {
					reject(error)
				})
			})
		},
		referer: function(type) {
			return new Promise((resolve, reject) => {
				referer.get(type).then(response => {
					resolve(response);
				}).catch(error => {
					reject(error)
				})
			})
		}
	},
}

export default method;

import * as referers from './referer/index'
let referer = referers.default;
import * as traffics from './traffic/index'
let traffic = traffics.default;
export {
	referer,traffic
}
const install = function(Vue, options) {
	const components = require.context('./', true, /.vue$/)
	components.keys().forEach(fileName => {
		const componentConfig = components(fileName)['default']
		Vue.component(componentConfig.name, componentConfig)
	})
}
export default install

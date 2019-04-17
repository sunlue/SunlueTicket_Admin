import * as visitors from './visitor/index'
let visitor = visitors.default;
import * as referers from './referer/index'
let referer = referers.default;
export {
	visitor,referer
}
const install = function(Vue, options) {
	const components = require.context('./', true, /.vue$/)
	components.keys().forEach(fileName => {
		const componentConfig = components(fileName)['default']
		Vue.component(componentConfig.name, componentConfig)
	})
}
export default install

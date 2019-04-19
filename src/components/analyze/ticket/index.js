import * as generates from './generate/index'
let generate = generates.default;
export {
	generate
}
export default function(Vue, options) {
	const components = require.context('./', true, /.vue$/)
	components.keys().forEach(fileName => {
		const componentConfig = components(fileName)['default']
		Vue.component(componentConfig.name, componentConfig)
	})
}

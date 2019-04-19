import * as unifieds from './unified/index'
let unified = unifieds.default;
export {
	unified
}
export default function(Vue, options) {
	const components = require.context('./', true, /.vue$/)
	components.keys().forEach(fileName => {
		const componentConfig = components(fileName)['default']
		Vue.component(componentConfig.name, componentConfig)
	})
}

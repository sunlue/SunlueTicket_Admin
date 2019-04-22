import * as generates from './generate/index'
let generate = generates.default;
import * as sala from './salas/index'
let salas = sala.default;
export {
	generate,salas
}
export default function(Vue, options) {
	const components = require.context('./', true, /.vue$/)
	components.keys().forEach(fileName => {
		const componentConfig = components(fileName)['default']
		Vue.component(componentConfig.name, componentConfig)
	})
}

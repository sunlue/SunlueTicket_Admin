import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
//iview框架
import iView from 'iview'
import 'iview/dist/styles/iview.css';
Vue.use(iView, {
	transfer: true,
});
//日历插件
import calendar from 'vue-full-calendar'
import 'fullcalendar/dist/fullcalendar.css'
Vue.use(calendar)

Vue.config.productionTip = false
new Vue({
	router,
	store,
	render: h => h(App)
}).$mount('#app')

import Vue from 'vue'
import App from './App.vue'
//路由管理
import router from './router'
//状态管理
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

//图表插件
import ECharts from 'vue-echarts'
import themeBigData from '@/assets/echart/theme/big-data.json';
import themeOrdinary from '@/assets/echart/theme/ordinary.json';
ECharts.registerTheme('big-data', themeBigData);
ECharts.registerTheme('ordinary', themeOrdinary);
Vue.component('v-chart', ECharts)

Vue.config.productionTip = false
new Vue({
	router,
	store,
	render: h => h(App)
}).$mount('#app')

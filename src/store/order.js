import orderList from '@/api/order/list'
import orderTicket from '@/api/order/ticket'
const order = {
	state: {
		orderList: '',
		notRecord: ''
	},
	mutations: {
		SET_ORDER_LIST(state, data) {
			state.orderList = data
		},
		SET_NOT_RECORD(state, data)  {
			state.notRecord = data
		}
	},
	actions: {
		getOrderList({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				orderList.get(params).then(response => {
					const data = response.data
					commit('SET_ORDER_LIST', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		cancelOrder({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				orderList.cancel(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		removeOrder({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				orderList.remove(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getOrderTicket({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				orderTicket.get(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		refundOrderTicket({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				orderTicket.refund(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		CheckOrderTicket({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				orderTicket.check(params).then(response => {
					const data = response.data
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		}
	}
}
export default order;

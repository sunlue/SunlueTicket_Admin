import ticketList from '@/api/ticket/list'
import ticketCheck from '@/api/ticket/check'
import ticketPrice from '@/api/ticket/price'
import ticketSettingType from '@/api/ticket/setting/type'
import ticketSettingKnow from '@/api/ticket/setting/know'

export default {
	state: {
		notRecord: '',
		ticketTypeTicket: [],
		ticketCheck: []
	},
	mutations: {
		SET_NOT_RECORD(state, data) {
			state.notRecord = data
		},
		SET_TICKET_TYPE_TICKET(state, data) {
			state.ticketTypeTicket = data;
		},
		SET_TICKET_CHECK(state, data) {
			state.ticketCheck = data;
		}
	},
	actions: {
		//ticketList
		setTicketList({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketList.set(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getTicketList({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketList.get(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		removeTicketList({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketList.remove(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		editTicketList({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketList.edit(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		setTicketListAttr({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketList.attr(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getTicketListPrice({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketList.price(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		//ticketPrice
		getTicketPrice({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketPrice.get(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		setTicketPrice({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketPrice.set(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		//ticketSettingType
		setTicketType({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingType.set(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getTicketType({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingType.get(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		enableTicketType({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingType.enable(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		removeTicketType({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingType.remove(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getTicketTypeTicket({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingType.get(params, true).then(response => {
					const data = response.data;
					commit('SET_TICKET_TYPE_TICKET', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		//ticketCheck
		ticketCheck({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketCheck.check(params, true).then(response => {
					const data = response.data;
					commit('SET_TICKET_CHECK', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		//ticketSettingKnow
		setTicketKnow({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingKnow.set(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getTicketKnow({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingKnow.get(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		getTicketKnowAll({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingKnow.all(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		removeTicketKnow({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingKnow.remove(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
		editTicketKnow({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				ticketSettingKnow.edit(params).then(response => {
					const data = response.data;
					commit('SET_NOT_RECORD', data);
					resolve(data);
				}).catch(error => {
					reject(error)
				})
			})
		},
	}
}

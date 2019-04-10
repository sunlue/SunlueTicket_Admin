import request from '@/utils/request'

const Ticket = function() {}
Ticket.prototype.get = function(userInfo) {
	return request({
		url: 'order/ticket/get',
		method: 'post',
		data: userInfo
	})
}
Ticket.prototype.check = function(userInfo) {
	return request({
		url: 'order/ticket/check',
		method: 'post',
		data: userInfo
	})
}
Ticket.prototype.refund = function(userInfo) {
	return request({
		url: 'order/ticket/refund',
		method: 'post',
		data: userInfo
	})
}
export default new Ticket();

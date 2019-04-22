import index from '@/api/analyze'

export default {
	state: {
		notRecord: '',
		basisData: ''
	},
	mutations: {
		SET_NOT_RECORD(state, data) {
			state.notRecord = data
		},
		SET_BASIS_DATE(state, data) {
			state.basisData = data
		},
	},
	actions: {
		getTotalBasis({
			commit
		}, params) {
			return new Promise((resolve, reject) => {
				if (this.getters.basisData) {
					resolve(this.getters.basisData);
				} else{
					index.basis(params).then(response => {
						const data = response.data;
						commit('SET_BASIS_DATE', data);
						resolve(data);
					}).catch(error => {
						reject(error)
					})
				}
			})
		},
	},
	getters:{
		basisData:state=>{
			return state.basisData;
		}
	}
}

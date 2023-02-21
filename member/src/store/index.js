import { createStore } from 'vuex'

export default createStore({
  state: {
    order: [],
    point: 0,
    shop_num: 0,
    shop_name:'',
    order_num:0,
    face: true
  },
  getters: {
    order: state => {
      return state.order
      
    },
    point: state => {
      return state.point
    },
    shop_num: state => {
      return state.shop_num
    },
    shop_name: state => {
      return state.shop_name
    },
    order_num: state => {
      return state.order_num
    },
    face: state => {
      return state.face
    }

  },
  mutations: {
    addOrder(state, order){
      state.order = order
    },
    addquantity(state,target){
      state.order[target].quantity++
    },
    cutquantity(state,target){
      state.order[target].quantity--
    },
    removegoods(state,target){
      state.order.splice(target,1)
    },
    userpoint(state, point){
      state.point = point
    },
    //選擇哪一間店家的key
    addshop_num(state, num){
      state.shop_num = num
    },
    addshop_name(state,name){
      state.shop_name = name
    },
    addorder_num(state,num){
      state.order_num = num
    },
    face_value(state,value){
      state.face = value
    }
  },
  actions: {
    //訂單明細
    getOrder(context,order){
      context.commit('addOrder',order)
    },
    //增加餐點數量
    getaddquantity(context,target){
      context.commit('addquantity',target)
    },
    //減少餐點數量
    getcutquantity(context,target){
      context.commit('cutquantity',target)
    },
    //刪除餐點
    getremovegoods(context,target){
      context.commit('removegoods',target)
    },
    //點數折扣
    getuserpoint(context,point){
      context.commit('userpoint',point)
    },
    //選擇哪一間店家的key
    getaddshop_num(context,num){
      context.commit('addshop_num',num)
    },
    //儲存店家名稱
    getaddshop_name(context,name){
      context.commit('addshop_name',name)
    },
    //儲存訂單編號
    getorder_num(context,num){
      context.commit('addorder_num',num)
    },
    getface(context,value){
      context.commit('face_value',value)
    }
    
  },
  modules: {
  }

})

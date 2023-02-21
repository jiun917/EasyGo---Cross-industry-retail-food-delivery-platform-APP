<template>
  <div class="order">
      <div class="title">訂單</div>  
      <div class="orderlist">
        <q-scroll-area
            class="rounded-borders scroll"
            style="height: 80vh; width: 100%;"
            v-show = !orderlist.ok
        >
          <div class="order_info" v-for="(item,index) in orderlist" :key="index">
            <div class="order_header">
              <div v-if = !orderlist.ok class="shop_img_box"><img class="shop_img" :src="'/api/Img/shop/'+item.s_logo+'.png'"></div>
              <div class="number">訂單編號:{{item.o_num}}</div> 
              <div class="QRcode_box" @click="click_qrcode(item.o_num)">
                <qrcode-vue :value="item.o_num" :size="size"></qrcode-vue>
              </div>
            </div>
            <div class="order_detail">
              <div class="shop_name">{{item.s_name}}</div>
              <div class="order_create_time">訂單成立時間:{{item.o_datetime}}</div>
            </div>
            <div class="order_state">
              <div class="not_accept_">
                <div class="not_accept_div" :class="{not_accept_state: item.o_state=='未接單'}"></div>
                <span>未接單</span>
              </div>
              <div class="making">
                <div class="making_div" :class="{making_state: item.o_state=='已接單'}" ></div>
                <span>製作中</span> 
              </div>
              <div class="available">
                <div class="available_div" :class="{available_state: item.o_state=='可取餐'}"></div>
                <span>可取餐</span>
              </div>
            </div>
            <div class="divider"></div>
            <router-link to="/orderInfo">
              <div class="order_follow_box" @click="click_order_info">
                <div class="order_follow" @click="order_num(item.o_num),shop_num(item.s_num)">訂單追蹤</div>
              </div>
            </router-link>
          </div>
        </q-scroll-area>  
      </div>
      <div class="q-pa-md q-gutter-sm">
          <q-dialog v-model="qrcode_img">
            <qrcode-vue :value="value" size="150"></qrcode-vue>
          </q-dialog>
      </div>
  </div>
  <!-- <order-info 
  :isOrderInfo="isOrderInfo"
  @click_back="click_back"
  >
  </order-info> -->
  <order-dock></order-dock>
</template>

<script>
import OrderDock from '../components/Dock.vue'
import QrcodeVue from 'qrcode.vue'
import axios from 'axios'

export default {
    name: 'OrderPage',
    data() {
      return {
        // isOrderInfo: false,
        orderlist:[],
        size: 30,
        qrcode_img: false,
        value: ''
      }
    },
    components: {
      OrderDock,
      QrcodeVue
    },
    mounted(){
      axios.get('/api/member_orderlist.php',{
        params: {
          user_num: localStorage.getItem('token')
        }
        })
        .then(res => {
          this.orderlist = res.data
          console.log(this.orderlist)
        })
    },
    methods: {
      order_num(num) {
        this.$store.dispatch('getorder_num',num)
      },
      shop_num(num){
        this.$store.dispatch('getaddshop_num',num)
      },
      click_qrcode(num){
        this.qrcode_img = true
        this.value = num
      },
      
    }
}
</script>

<style lang="sass" scoped>
  .order
    position: relative
    height: 0
    padding-bottom: 200%
    margin-bottom: 1.42rem
    background-color: #FFD40080
    .title
      position: absolute
      left: 50%
      top: 0.5rem
      transform: translate(-50%,0)
      font-size: 0.5rem
      font-weight: bold
    .orderlist
      position: absolute
      top: 1.72rem
      height: 0
      right: 0
      left:0
      padding-bottom: 185%
      overflow: hidden
      background-color: #F5F5F5
      border-radius: 0.6rem
      font-weight: bold
      .rounded-borders scroll
        margin-top: 0.5rem
      .order_info
        height: 0
        padding-bottom: 45%
        border-radius: 0.5rem
        margin: 0.5rem 0.3rem
        background-color: #fff
        color: #707070
        .order_header
          position: relative
          display: flex 
          flex-direction: row
          justify-content: space-between
          align-items: center
          padding: 0.5rem 0.2rem
          height: 0.7rem
          .number
            flex-basis: 33%
          .shop_img_box
            position: relative
            top: 0.3rem
            overflow: hidden
            width: 1.3rem
            height: 1.3rem
            .shop_img
              width: 1.3rem
              height: 1.3rem
        .order_detail
          display: flex
          flex-direction: column
          align-items: center
          padding: 0.1rem
          .shop_name
            margin-top: -0.2rem
            font-size: 0.3rem
            font-weight: bold
            padding-bottom: 0.2rem
          .order_create_time
            font-size: 0.25rem   
        .order_state
          display: flex
          flex-direction: row
          justify-content: space-around
          padding: 0.1rem
          .not_accept_,.making,.available
            display: flex
            flex-direction: column
            align-items: center
            .not_accept_div,.making_div,.available_div
              margin-bottom: 0.1rem
              border: 0.01rem solid #A9A9A9
              width: 1.2rem
              height: 0.14rem
              border-radius: 5rem
            .not_accept_state,.making_state,.available_state
              background-color: #FFBD09
        .divider 
          margin: 0.05rem 0.5rem
          height: 0.05rem
          background-color: #FFBD0980
        .order_follow_box
          color: #fff
          padding-top: 0.2rem
          display: flex
          justify-content: center
          .order_follow
            border-radius: 1rem
            background-color: #FFBD09
            text-align: center
            padding: 0.1rem
            

          
          
      
      
      
    
</style>
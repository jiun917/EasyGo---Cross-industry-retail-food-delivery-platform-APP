<template>
    <div class="OrderInfo"> 
        <div class="header">
            <img v-if="shop_picture" class="shop_img" :src="'/api/Img/shop/' + shop_picture + '.jpg'" style="width:100%;height:210px">
            <router-link to="/order">
                <div class="back" @click="back">
                <span class="material-icons back_arrow">
                    navigate_before
                </span>
                </div>
            </router-link>
        </div>
        <div class="OrderState_time">
            <div class="order_time">
                <div class="time_img" v-show="order_state!='可取餐'">
                    <img  class="shop_img"  src="/api/Img/giphy.gif" style="width:145px;height:80px">
                </div>
                <div class="time_img" v-show="order_state=='可取餐'" @click="click_qrcode(order_num)">
                    <qrcode-vue :value="order_num" :size="size"></qrcode-vue>
                </div>
                <div class="complete_time">
                    <span class="expected_finish_time" v-show="order_state!='未接單' && order_state!='可取餐'">預計完成時間</span>
                    <span class="finish_time" v-show="order_state!='未接單' && order_state!='可取餐'">{{order_finishtime}}</span>
                    <span class="not_accepted" v-show="order_state=='未接單'">店家尚未接單</span>
                    <span class="not_accepted" v-show="order_state=='可取餐'">訂單已完成</span>
                </div>
            </div>
            <div class="order_state">
              <div class="not_accept">
                <div class="not_accept_div" :class="{not_accept_state: order_state=='未接單'}"></div>
                <span>未接單</span>
              </div>
              <div class="making">
                <div class="making_div" :class="{making_state: order_state=='已接單'}" ></div>
                <span>製作中</span> 
              </div>
              <div class="available">
                <div class="available_div" :class="{making_state: order_state=='可取餐'}"></div>
                <span>可取餐</span>
              </div>
            </div>
        </div>
        <div class="shop">
            <div class="shop_img_box">
                <img v-if="shop_logo" class="shop_img" :src="'/api/Img/shop/' + shop_logo + '.png'" style="width:50px;height:60px">
            </div>
            <div class="shop_name">{{shop_name}}</div>
            <div class="rating">
                <span class="material-icons icon-start">
                        star
                    </span>
                <span class="rating_word">{{shop_rating}}.0</span>
            </div>
        </div>
        <div class="order_content">
            <q-scroll-area
            class="rounded-borders scroll"
            style="height:2.68rem; width: 100%;"
            >
            <div class="order_number">訂單編號：{{order_num}}</div>
            <div class="order_goods">訂單內容</div>
            <div class="goods" v-for="(item,index) in orderInfo" :key="index">
                <div class="goods_quantity">x{{item.g_quantity}}</div>
                <div class="goods_name">{{item.g_name}}</div>
                <div class="goods_price">${{item.g_quantity*item.g_price}}元</div>
            </div>
            </q-scroll-area>
        </div>
       <div class="total_price">
            <div class="nodiscount_price">
                <span>小計</span>
                <span class="number">${{total}}</span>
            </div>
            <div class="discount_price">
                <span>折扣金額</span>
                <span class="number">-${{usepoint}}</span>
            </div>
            <div class="total">
                <span>總金額</span>
                <span class="number">${{total-usepoint}}</span>
            </div>
        </div>
        <div class="order_under">
            <div class="chat">
                <span class="material-icons">
                    question_answer
                </span>
            </div>
            <div class="phone">
                <span class="material-icons">
                    perm_phone_msg
                </span>
            </div>
            <div class="cancel_order">
                <div class="word">
                    取消訂單
                </div>
            </div>
        </div>
        <div class="q-pa-md q-gutter-sm">
          <q-dialog v-model="qrcode_img">
            <qrcode-vue :value="value" :size="300"></qrcode-vue>
          </q-dialog>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import QrcodeVue from 'qrcode.vue'
export default {
    name:'OrderInfoPage',
    data(){
        return{
            order_num: '',
            orderInfo: [],
            shop_name: '',
            order_state:'',
            shop_rating:'',
            shop_logo:'',
            shop_picture:'',
            usepoint: 0,
            order_finishtime:'',
            value: '',
            size: 100,
            qrcode_img: false,
        }
    },
    components: {
      QrcodeVue
    },
    async mounted() {
        this.order_num = this.$store.getters.order_num
        await axios.get('/api/member_orderInfo.php',{
            params: {
                order_num: this.order_num
            }
        })
        .then(res => {
            this.orderInfo = res.data
            console.log(this.orderInfo)
            this.shop_name = this.orderInfo[0].s_name
            this.order_state = this.orderInfo[0].o_state
            this.shop_logo = this.orderInfo[0].s_logo
            this.usepoint = this.orderInfo[0].o_discount
            this.shop_picture = this.orderInfo[0].s_pic
            this.order_finishtime = this.orderInfo[0].o_finishtime.substr(11,5)
            
        })

        axios.get('/api/member_shop_rating.php',{
            params: {
            shop_num: this.$store.getters.shop_num
            }
        })
        .then(res => {
            this.shop_rating = res.data[0].s_rating
            
        })

        this.setTimeoutFun()
      
    },
    computed:{
        total() {
            var totalprice = 0
            for(var i = 0; i<this.orderInfo.length; i++)
            {
                totalprice += this.orderInfo[i].g_quantity*this.orderInfo[i].g_price
            }
            return totalprice
        }
    },
    methods:{
        get_order_state(){
            console.log('time')
            axios.get('/api/member_get_order_state.php',{
            params: {
                order_num: this.order_num
            }
        })
        .then(res => {
            if(res.data.o_finishtime.substr(11,5) != this.order_finishtime || res.data.o_state != this.order_state) {
                console.log('change')
                this.order_finishtime = res.data.o_finishtime.substr(11,5)
                this.order_state = res.data.o_state
                console.log(res.data.o_state)
                if(res.data.o_state == "已完成"){
                    this.$router.push('/Point')
                }
            }
        })
        },
        setTimeoutFun(){
            this.timeOutRefresh = window.setInterval(() => {
                this.get_order_state()
            },3000)
        },
        back(){
            window.clearInterval(this.timeOutRefresh)
        },
        click_qrcode(num){
            this.qrcode_img = true
            this.value = num
        },
    }
}
</script>

<style lang="sass" scoped>
    .OrderInfo
        position: absolute
        top: 0
        right: 0
        height: 0
        width: 100%
        padding-bottom: 220%
        z-index: 101
        background-color: #F5F5F5
        .header
            position: relative
            height: 4.2rem
            overflow: hidden
            .header_img
                width: 100%
            .back
                border: solid 0.01rem white
                border-radius: 100%
                background-color: #fff
                overflow: hidden
                position: absolute
                top: 0.2rem
                left: 0.2rem
                width: 0.6rem
                height: 0.6rem
                align-content: center
                .back_arrow
                    position: absolute
                    top: 50%
                    left: 50%
                    transform: translate(-50%,-50%)
                    font-size: 0.5rem
                    padding: 0
                    color: #000
        .OrderState_time
            margin: 0.3rem
            background-color: #fff           
            .order_time
                display: flex
                flex-direction: column
                align-items: center
                .complete_time
                    display: flex
                    flex-direction: column
                    align-items: center
                    font-size: 0.3rem
                    font-weight: bold
                    .expected_finish_time
                        margin-top: 0.3rem
                        font-size: 0.4rem
                    .finish_time
                        margin-bottom: 0.3rem
                        font-size: 0.4rem
                    .not_accepted
                        margin-top: 0.3rem
                        margin-bottom: 0.3rem
                        font-size: 0.4rem
            .order_state
                display: flex
                flex-direction: row
                justify-content: space-around
                padding: 0.1rem
                .not_accept,.making,.available
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
        .shop
            margin: 0 0.3rem
            padding: 0.1rem
            background-color: #fff
            display: flex
            flex-direction: row
            justify-content: space-around
            align-items: center
            font-weight: bold
            .shop_name
                font-size: 0.35rem
            .icon-start
                font-size: 0.4rem
                margin-right: 0.1rem
                color: #FFBD09
            .rating_word
                color: #707070
                font-size: 0.15rem
        
        .order_content
            margin: 0.3rem
            padding: 0.2rem
            background-color: #fff
            font-weight: bold
            .order_number
                margin: 0.2rem    
            .order_goods  
                margin: 0.2rem 
            .goods  
                position: relative
                margin: 0.2rem 
                display: flex
                color: #707070
                .goods_quantity   
                    margin-right: 0.3rem
                .goods_price
                    position: absolute
                    right: 0
                    color: #FFBD09

        .total_price
            margin: 0.3rem
            padding: 0.2rem
            height: 1.7rem
            background-color: #fff
            font-weight: bold
            display: flex
            flex-direction: column
            justify-content: space-around
            .nodiscount_price,.discount_price,.total
                display: flex
                flex-direction: row
                justify-content: space-between
                .number
                    color: #FFBD09    
                
        .order_under
            display: flex
            flex-direction: row
            justify-content: space-between
            align-items: center
            padding: 0 0.3rem
            .chat,.phone
                position: relative
                width: 0.8rem
                height: 0.8rem
                border-radius: 50%
                background-color: #FFBD09 
                .material-icons   
                    font-size: 0.5rem
                    color: black    
                    position: absolute
                    top: 50%
                    left: 50%
                    transform: translate(-50%,-50%)   
            .cancel_order
                position: relative
                width:4.36rem 
                height: 0.66rem
                border-radius: 0.5rem
                background-color: #FFBD09
                .word
                    display: flex
                    flex-direction: column
                    position: absolute
                    top: 50%
                    left: 50%
                    transform: translate(-50%,-50%)  
                    font-size: 0.3rem
                    font-weight: bold
                    color: white    
                 
            


                

</style>
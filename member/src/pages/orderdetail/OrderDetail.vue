<template>
    <div class="OrderInfo"> 
        <div class="header">
            <img v-if="shop_picture" class="shop_img" :src="'/api/Img/shop/' + shop_picture + '.jpg'" style="width:100%;height:210px">
            <router-link to="/member">
                <div class="back">
                <span class="material-icons back_arrow">
                    navigate_before
                </span>
                </div>
            </router-link>
        </div>
        <div class="shop">
            <div class="shop_img_box">
                <img v-if="shop_logo" class="shop_img" :src="'/api/Img/shop/' + shop_logo + '.png'" style="width:50px;height:60px">
            </div>
            <div class="shop_name">{{shop_name}}</div>
        </div>
        <div class="order_info">
            <div class="order_number">訂單編號：{{order_num}}</div>
            <div class="order_finish_time">訂單完成時間：{{order_finishtime}}</div>
            <div class="order_location">取餐於：{{shop_address}}</div>
        </div>
        <div class="order_content">
            <q-scroll-area
            class="rounded-borders scroll"
            style="height:2.68rem; width: 100%;"
            >
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
    </div>
</template>

<script>
import axios from 'axios'
export default {
    name:'OrderDetail',
    data(){
        return{
            orderInfo: [],
            shop_name: '',
            order_state:'',
            shop_rating:'',
            shop_logo:'',
            order_finishtime:'',
            order_num:'',
            shop_picture:'',
            shop_address:'',
            usepoint: 0
        }
    },
    mounted() {
        
        axios.get('/api/member_orderInfo.php',{
            params: {
                order_num: this.$store.getters.order_num
            }
        })
        .then(res => {
            this.orderInfo = res.data
            console.log(this.orderInfo)
            this.shop_name = this.orderInfo[0].s_name
            this.shop_logo = this.orderInfo[0].s_logo
            this.usepoint = this.orderInfo[0].o_discount
            this.shop_picture = this.orderInfo[0].s_pic
            this.shop_address = this.orderInfo[0].s_address
            this.order_num = this.orderInfo[0].o_num 
            this.order_finishtime = this.orderInfo[0].o_finishtime
            
        })

       
      
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
                    .expected_finish_time,.finish_time
                        margin-top: 0.2rem
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
            margin: 0.5rem 0.3rem
            padding: 0.1rem
            background-color: #fff
            display: flex
            flex-direction: row
            justify-content: center
            align-items: center
            font-weight: bold
            .shop_name
                font-size: 0.35rem
                margin-left: 0.4rem
            .icon-start
                font-size: 0.4rem
                margin-right: 0.1rem
                color: #FFBD09
            .rating_word
                color: #707070
                font-size: 0.15rem
        
        .order_info
            margin: 0.3rem
            padding: 0.2rem
            background-color: #fff
            font-weight: bold
            .order_number,.order_finish_time,.order_location
                margin: 0.2rem
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
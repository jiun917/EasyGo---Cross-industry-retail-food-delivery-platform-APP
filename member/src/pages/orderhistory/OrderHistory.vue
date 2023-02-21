<template>
<div class="PersonalInfo_div">
    <div class="PersonalInfo">
        <router-link to="Member">
            <div class="back" >
            <span class="material-icons back_arrow">
                navigate_before
            </span>
            </div>
        </router-link>
        <div class="title">歷史訂單</div>
    </div>
    <div class="shoplist_div">
        <div class="tips" v-show="orderlist.ok">無歷史訂單，請前往店家頁面選購</div>
        <div class="shoplist" v-show="!orderlist.ok">
            <div class="shop_div" v-for="(item,index) in orderlist" :key="index" @click="order_detail(item.o_num)">
                <div class="shop_img">
                    <img class="img" v-if="!orderlist.ok" :src="'/api/Img/shop/' + item.s_logo + '.png'">
                </div>
                <q-separator vertical />
                <div class="shop_info">
                    <div class="shop_name ">
                        <span class="material-icons check">
                            check_circle
                        </span>
                        <div class="ellipsis">{{item.s_name}}</div>
                    </div>
                    <div class="order_date">訂單日期：<br>{{item.o_datetime}}</div>
                    <div class="content">詳細內容...</div>
                    <div class="price">${{item.price}}</div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import axios from 'axios'
export default {
    name:'OrderHistoryPage',
    data(){
        return{
            orderlist:[],
            orderInfo:[],
            order_price: [],
        }
    },
    methods:{
      async get_orderList(){
        await axios.get('/api/member_order_history.php',{
        params: {
          user_num: localStorage.getItem('token')
        }
        })
        .then(res => {
          this.orderlist = res.data
          console.log(this.orderlist)
        })
      },
      async get_orderInfo(){
        for(var i=0;i<this.orderlist.length;i++){
            await axios.get('/api/member_orderInfo.php',{
            params: {
                order_num: this.orderlist[i].o_num
            }
            })
            .then(res => {
                this.orderInfo[i] = res.data
            })
        }
      },
      total_price(){
        for(var k=0;k<this.orderlist.length;k++){
            for(var i=0; i< this.orderInfo[k].length;i++){
                this.order_price = this.order_price + this.orderInfo[k][i].g_price*this.orderInfo[k][i].g_quantity
                this.order_price = parseInt(this.order_price)
                if(this.orderInfo[k][i].s_rating == null){
                    this.orderlist[k].comment = 'false'
                }
            }
            this.orderlist[k].price = this.order_price
            this.order_price = 0
        }
      },
      order_detail(num){
        this.$store.dispatch('getorder_num',num)
        this.$router.push('/orderdetail')
      }
    },
    async mounted(){
        await this.get_orderList()
        await this.get_orderInfo()
        await this.total_price()
    }
}
</script>

<style lang="sass" scoped>
.PersonalInfo_div
    position: relative
    height:0
    top:0
    left:0
    padding-bottom: 900px
    width: 100%
    background-color: #FFD40080
    font-size: 25px
    .PersonalInfo
        position: relative
        padding-top: 25px
        display: flex
        flex-direction: row
        .title
            position: relative
            top: 0          
            bottom: 0          
            left: 0       
            right: 0
            margin: auto
            font-weight: bold
        .back
            position: absolute
            left: 5px
            border-radius: 50%
            background-color: #fff
            height: 30px
            width: 30px
            .back_arrow
                position: absolute
                top: 50%
                left: 50%
                transform: translate(-50%,-50%)
                font-size: 0.5rem
                padding: 0
                font-size: 25px
                color: black 
    .shoplist_div
        position: ralative
        border-radius: 30px 30px 0 0
        background-color: #F5F5F5
        padding-bottom: 10px
        height: 850px
        margin-top: 20px
        
        .tips
            font-size: 0.4rem
            margin-top: 0.5rem
            text-align: center
            font-weight: bold
        .shoplist
            padding: 30px
            display: flex
            flex-direction: column
            padding: 0.4rem
            font-size: 0.3rem
            .shop_div
                position: relative
                display: flex
                flex-direction: row
                height: 2.45rem
                background-color: #fff
                border: solid 1px #FFBD09
                margin-bottom:  0.4rem
                overflow: hidden
                .shop_img   
                    width: 3rem
                    height: 2.45rem
                    overflow: hidden
                    flex-shrink: 0
                    .img
                        width: 3rem
                        height: 2.45rem
                .shop_info
                    display: flex
                    flex-direction: column
                    align-self: center
                    justify-self: center
                    font-size: 0.3rem
                    font-weight: bold
                    margin:  auto
                    .shop_name
                        display: flex
                        flex-direction: row
                        margin-left: -0.2rem
                        font-size: 0.35rem
                        margin-bottom: 0.15rem
                        .check
                            color: #FFBD09
                            font-size: 0.4rem
                    .order_date
                        color:#6A6A6A 
                        margin-bottom: 0.15rem
                    .content
                        color:#6A6A6A 
                    .price
                        align-self: flex-end
                        color: #FFBD09
                    
                        
                    
                        

                
</style>

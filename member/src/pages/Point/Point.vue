<template>
<div class="Point_div" v-show="!RatingPage">
    <div class="Point">
        <router-link to="Member">
            <div class="back" >
            <span class="material-icons back_arrow">
                navigate_before
            </span>
            </div>
        </router-link>
        <div class="title">點數</div>
    </div>
    <div class="content_div">
        <div class="point_illustrate">
            <div class="illustrate">
                <p class="title">點數獲取方式說明:</p>
                <br>
                <p>點數獲取方式主要是透過完成訂單評價後，星數評價未必填，敘述評價為可填可不填，完成評價後送出即可獲得0.1~1點。</p>
                <br>
                <p class="title">點數使用方式說明:</p>
                <br>
                <p>點數使用方法為一點可以折抵1元，在購物車頁面透過使用折扣，輸入你想使用的點數，來進行折扣的動作。</p>
            </div>
            <div class="tips">完成以下訂單評價，即可獲得點數</div>
        </div>
        <div class="shop_list_div">
            <div class="title">未評價</div>
            <div class="divide"></div>
                <div class="shoplist" v-show="!orderlist.ok">
                    <div class="shop_div" v-for="(item,index) in orderlist" :key="index" @click="rating(item.o_num)">
                        <div class="shop_img">
                            <img class="img" v-if="!orderlist.ok" :src="'/api/Img/shop/' + item.s_logo + '.png'">
                        </div>
                        <q-separator vertical />
                        <div class="shop_info">
                            <div class="shop_name">
                                <span class="material-icons check">
                                    check_circle
                                </span>
                                {{item.s_name}}
                            </div>
                            <div class="order_date">訂單日期：<br>{{item.o_datetime}}</div>
                            <div class="content">前往評價</div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<!-- <rating-order :RatingPage="RatingPage" :rating_order="rating_order"></rating-order> -->
</template>

<script>
import axios from 'axios'
// import RatingOrder from './components/Rating.vue'
export default {
    name:'PointPage',
    data(){
        return{
            user_num: '',
            orderlist: [],
            RatingPage: false,
            rating_order: {}
        }
    },
    // components:{
    //     RatingOrder
    // },
    mounted(){
        this.get_orderList()
    },
    methods:{
        async get_orderList(){
        await axios.get('/api/member_not_rated.php',{
        params: {
          user_num: localStorage.getItem('token')
        }
        })
        .then(res => {
          this.orderlist = res.data 
          console.log(this.orderlist)
        })
      },
      rating(index){
        this.$store.dispatch('getorder_num',index)
        this.$router.push('/rating')
      }
    }
}
</script>

<style lang="sass" scoped>
.Point_div
    position: relative
    height:0
    top:0
    left:0
    padding-bottom: 900px
    width: 100%
    background-color: #FFD40080
    font-size: 25px
    .Point
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
    .content_div
        position: ralative
        height:0
        top:0
        left:0
        border-radius: 30px 30px 0 0
        background-color: #F5F5F5
        padding-bottom: 830px
        margin-top: 20px
        overflow: hidden
        .point_illustrate
            padding: 0.8rem
            font-size: 0.32rem
            font-weight: bold 
            .illustrate
                padding: 0.3rem
                border: solid 2px #FFBD09
                margin-bottom: 0.3rem
                color: #707070
                background-color: #fff
                .title
                    text-align: center
                    font-size: 0.35rem
                    color: black    
            .tips 
                border: solid 2px #FFBD09
                padding: 0.3rem
                background-color: #fff
                font-size: 0.35rem
                color: red
                text-align: center
        .shop_list_div
            .title
                font-size: 0.35rem
                font-weight: bold
                text-align: center
            .divide
                height: 0.05rem
                background-color: #FFBD09
                margin: 0.2rem 0.4rem
            .shoplist
                padding: 0.4rem
                display: flex
                flex-direction: column
                font-size: 0.3rem
                .shop_div
                    position: relative
                    display: flex
                    flex-direction: row
                    height: 2.3rem
                    background-color: #fff
                    border: solid 1px #FFBD09
                    margin-bottom:  0.4rem
                    .shop_img   
                        width: 3rem
                        height: 2.3rem
                        .img
                            width: 3rem
                            height: 2.3rem
                    .heart
                        position: absolute
                        top: 0.1rem
                        right: 0.1rem
                        font-size: 0.45rem
                        color: #FFBD09
                    .shop_info
                        display: flex
                        flex-direction: column
                        font-size: 0.3rem
                        font-weight: bold
                        margin: auto
                        .shop_name
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
                            color: red
                        .price
                            align-self: flex-end
                            color: #FFBD09
            
            
</style>


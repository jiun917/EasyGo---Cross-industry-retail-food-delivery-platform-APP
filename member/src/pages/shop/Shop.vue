<template>
    <div class="shopinfo">
        <div class="header">
            <div class="header_1">
                <router-link to="/">
                    <div class="circle back">
                        <span class="material-icons back_arrow">
                            navigate_before
                        </span>
                    </div>
                </router-link>
            </div>
            <div class="shop">
                <div class="shop_name">
                    <div class="name">{{shop_name}}</div>
                    <div class="detail">
                        <div class="time">{{estimatedtime}}min</div>
                        <div class="distance">5km Restaurant</div>
                    </div>
                </div>
                <div class="shopicon">
                    <div class="circle icon">
                        <img class="shop_img" :src="'/api/Img/shop/shop_' + select_shop_num + '_logo.png'">
                    </div>
                </div>
            </div>
        </div>
        <div class="goods_list">
            <div class="goods_title">
                <div class="slogan">{{shop_slogan}}</div>
                <div class="collection">
                        <span 
                        class="material-icons heart" 
                        :class="{like: islike}"
                        @click="this.click_like()"
                        >
                            favorite
                        </span>
                        <span>收藏</span>
                </div>
                <div class="shop_rating" v-show="shop_rating">
                    <span class="material-icons icon-start" >
                        star
                    </span>
                    <span  class="shop_rating_word">{{shop_rating}}.0</span>
                </div>
            </div>
            <div class="goods_select">
                <div 
                class="recommend circle"
                :class="{select: select_r}"
                @click="this.select('r')"
                >
                    推薦
                </div>
                <div 
                class="popular circle"
                :class="{select: select_p}"
                @click="this.select('p')"
                >
                    受歡迎
                </div>
            </div>
            <q-scroll-area
            class="rounded-borders scroll"
            style="height: 55vh; width: 100%;"
            >
                <div 
                v-for="(item,index) in goods_info"
                :key="index"
                class="goods_list_info"  
                @click="click_goods(index)"
                >
                    <div class="goods_circle">
                        <img class="goods_img" :src="'/api/Img/goods/' + item.g_pic + '.jpg'">
                    </div>
                    <div class="goods_info">
                        <div class="goods_name">{{item.g_name}}</div>
                        <div class="goods_introduce">{{item.g_description}}</div>
                    </div>
                    <div class="goods_rating">
                            <div class="rating" v-show="item.g_rating">
                                <span class="material-icons icon-start">
                                    star
                                </span>
                                <span  class="goods_rating_word">{{item.g_rating}}.0</span>
                            </div>
                            <div class="good_price">${{item.g_price}}</div>
                    </div>
                </div>
            </q-scroll-area>
        </div>

        <div class="shopCart">
            <keep-alive>
                <router-link to="/shopcart" >
                <div class="shopCart_button" @click="addOrder">
                    <div class="shopcartnum" v-show="shopcartnum>0">
                        <span class="number">{{shopcartnum}}</span>
                    </div> 
                    <div class="word" >前往購物車</div>
                </div>
                </router-link>
            </keep-alive>
            
        </div>
 
        <shop-goods 
        :goodsItem="goodsItem" 
        :isselectgoods="isselectgoods" 
        @addshopcart="addshopcart"
        :shop_name="shop_name"
        >
        </shop-goods>
    </div>
    
</template>

<script>
import ShopGoods from './components/Goods.vue'
import axios from 'axios'

export default {
    name:'ShopPage',
      data()  {
        return {
            select_shop_num: '',
            goods_info: [],
            shop_name:'',
            shop_slogan:'',
            shop_rating:'',
            islike: false,
            select_r: true,
            select_p: false,
            select_c: false,
            isselectgoods:false,
            goodsItem: {},
            order:[],
            shopcartnum:'',
            estimatedtime:0,
            user_num:''
        }
    },
    components: {
        ShopGoods
    },
    mounted(){
        this.select_shop_num = this.$store.getters.shop_num
        axios.get('/api/member_goods_list.php',{
        params: {
          data_shop_num: this.select_shop_num
        }
        })
        .then(res => {
          this.goods_info = res.data
          this.shop_name = this.goods_info[0].s_name 
          this.shop_slogan = this.goods_info[0].s_slogan
          this.shop_rating = this.goods_info[0].s_rating
          this.estimatedtime = this.goods_info[0].s_estimatedtime
        })

        this.user_num = localStorage.getItem('token')
        axios.get('/api/member_confirm_collect.php',{
        params: {
          user_num : this.user_num,
          shop_num : this.select_shop_num
        }
        })
        .then(res => {
          this.islike = res.data
        })


        if(this.$store.getters.order){
            this.order=this.$store.getters.order
            this.shopcartnum=this.order.length
        }

    },
    methods: {
        click_like() {
            this.islike = !this.islike
            if(this.islike){
                axios.get('/api/member_shop_favorite.php',{
                    params: {
                        user_num : this.user_num,
                        shop_num : this.select_shop_num
                    }
                })
            }else{
                axios.get('/api/member_shop_cancel_favoriate.php',{
                    params: {
                        user_num : this.user_num,
                        shop_num : this.select_shop_num
                    }
                })
            }
        },
        select(s) {
            this.select_r = false
            this.select_p = false
            this.select_c = false
            if(s=='r')
                this.select_r = true
            else if(s=='p')
                this.select_p = true 
            else
                this.select_c = true
        },
        click_goods(key){
            this.goodsItem = this.goods_info[key]
            this.isselectgoods = true
            
        },
        addshopcart(shopcart) {
            this.isselectgoods = false
            this.order=shopcart
            this.shopcartnum = shopcart.length
        },
        addOrder() {
            this.$store.dispatch('getOrder',this.order)
        }
    }
}
</script>

<style lang="sass" scoped>
    .shopinfo
        position: relative
        height: 0
        padding-bottom: 190%
        margin-bottom: 1.42rem
        background-color: #FFD40080
        .shopCart
            position: fixed
            bottom: 0.3rem
            width: 100%
            height: 0.66rem
            display: flex
            justify-content: center
            .shopCart_button
                position: relative
                font-size: 0.3rem
                padding: 0.16rem
                text-align: center
                border-radius: 0.5rem
                background-color: #FFBD09
                width: 6.36rem
                height: 0.66rem
                .shopcartnum
                    position: absolute
                    top:0.08rem
                    left:0.2rem
                    background-color: white
                    width: 0.5rem 
                    height: 0.5rem
                    border-radius: 100%
                    text-align: center
                    color: #FFBD09
                    .number
                        position: absolute
                        top: 50%
                        left: 50%
                        transform: translate(-50%,-50%)
                        font-size: 0.4rem
                        font-weight: bold
                .word
                    color: #fff
                    font-weight: bold
        .header
            position: relative
            height: 0 
            padding-bottom: 40%
            .header_1
                padding: 0.6rem 0 0.54rem 0.3rem
                .circle
                    border: solid 0.01rem white
                    border-radius: 100%
                    background-color: #fff
                    overflow: hidden
                .back
                    position: relative
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
            .shop 
                display: flex
                flex-direction: row
                .shop_name
                    display: flex
                    flex-grow: 1
                    flex-direction: column
                    margin: 0 0.5rem
                    justify-content: space-between
                    font-weight: bold
                    .name
                        font-size: 0.5rem
                    .detail 
                        display: flex
                        flex-direction: row
                        justify-content: space-between
                        align-items: center
                        font-size: 0.3rem
                        font-weight: bold
                        .time
                            padding: 0.1rem
                            border-radius: 0.2rem
                            background-color: #D3D3D380

                .icon
                    border-radius: 50%
                    overflow: hidden
                    width: 1.5rem
                    height: 1.5rem
                    margin: 0 0.3rem
                    .shop_img
                        height: 1.5rem
                        width: 1.5rem
                        border-radius: 50%
                        
    .goods_list 
        height: 14.5rem
        background-color: #F5F5F5
        border-top-left-radius: 0.6rem
        border-top-right-radius: 0.6rem
        .goods_title
            padding: 0.4rem 0 0 0
            display: flex
            flex-direction: row
            margin: 0.36rem 0.52rem 0 0.6rem
            align-items: center
            font-weight: bold
            .slogan 
                flex-grow: 1
                font-size: 0.3rem
            .collection 
                margin-right: 0.2rem
            .material-icons 
                font-size: 0.45rem
                margin-right: 0.1rem
            .icon-start
                color: #FFBD09
            .like 
                color: #FFBD09
            .shop_rating
                font-size: 0.3rem
        .goods_select
            font-size: 0.3rem
            font-weight: bold
            display: flex
            flex-direction: row
            justify-content: space-around
            margin: 0.36rem 0.52rem 0 0.6rem
            .circle
                padding: 0.2rem
                border-radius: 0.3rem
                background-color: #FFFFFF
            .select
                background-color: #FFBD09
        .scroll
            margin-top: 0.2rem
        .goods_list_info
            margin: 0.3rem
            background-color: #fff
            border-radius: 0.3rem
            display: flex
            flex-direction: row
            justify-content: flex-start
            padding: 0.3rem
            .goods_circle
                flex-shrink: 0
                border-radius: 100%
                overflow: hidden 
                margin: 0 0.18rem
                width: 2.12rem
                height: 2.46rem
                .goods_img
                    width:106px
                    height: 123px
                    border-radius: 100%
            .goods_info 
                display: flex
                flex-direction: column
                margin: 0 0.3rem
                .goods_name
                    font-size: 0.5rem
                    margin-bottom: 0.3rem
                .goods_introduce
                    flex-wrap: wrap
                    color: grey
            .goods_rating
                position: absolute
                right: 0
                padding-right: 0.5rem
                display: flex
                flex-direction: column
                align-self: flex-end
                justify-content: flex-end
                .rating
                    display: flex
                    flex-direction: row
                    justify-content: flex-end
                    align-items: center
                    text-align: center
                    .goods_rating_word
                        font-size: 0.3rem
                        font-weight: bold
                    .icon-start
                        font-size: 0.45rem
                        color: #FFBD09
                .good_price
                    font-size: 0.4rem
                    color: #FFBD09
                    font-weight: bold
                    display: flex
                    justify-content: flex-end
 
</style>
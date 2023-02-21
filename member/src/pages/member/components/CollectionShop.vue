<template>
<div class="collection_div" v-show="CollectionShopPage">
    <div class="collection">
        <div class="back" >
            <span class="material-icons back_arrow" @click="goback">
                navigate_before
            </span>
        </div>
        <div class="title">收藏店家</div>
    </div>
    <div class="shoplist_div">
        <div class="tips" v-if="shop_data.ok">還未有收藏的店家</div>
        <div class="shoplist" v-show="!shop_data.ok" >
            <div class="shop_div" v-for="(item,index) in shop_data" :key="index" >
                <div class="shop_img" @click="click_shop(item.s_num)">
                    <img class="img" v-if="!shop_data.ok" :src="'/api/Img/shop/' + item.s_logo + '.png'">
                </div>
                <q-separator vertical />
                <div class="shop_info" @click="click_shop(item.s_num)">
                    <div class="shop_name">{{item.s_name}}</div>
                    <div class="classification">{{item.s_classification}}</div>
                    <div class="rating" v-show="item.s_rating">
                        <span class="material-icons icon-start">
                            star
                        </span>
                        <div class="score">{{item.s_rating}}</div>   
                    </div>
                    <div class="rating" v-show="!item.s_rating">尚未有評價</div>
                </div>
                <div class="heart">
                    <span class="material-icons" @click="click_favorite(item.s_num)" >
                        favorite
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import axios from 'axios'
export default {
    name:'CollectionShop',
    data(){
        return{
            islike:true,
            shop_data: [],
            user_num: '',
            show: true
        }
    },
    props:{
        CollectionShopPage: Boolean,
        
    },
    mounted(){
        this.user_num = localStorage.getItem('token')
        axios.get('/api/member_collect_shop.php',{
            params: {
                user_num: this.user_num
            }
            })
            .then(res => {
                this.shop_data = res.data
            })
    },
    methods:{
        goback(){
            this.$emit("goback",'CollectionShopPage') 
        },
        async click_favorite(s_num){
            
            await axios.get('/api/member_shop_cancel_favoriate.php',{
            params: {
                user_num : this.user_num,
                shop_num : s_num
            }
            })

            await axios.get('/api/member_collect_shop.php',{
            params: {
                user_num: this.user_num
            }
            })
            .then(res => {
                this.shop_data = res.data
            })
        },
        click_shop(s_num){
            this.$store.dispatch('getaddshop_num',s_num)
            this.$router.push('/shop')
        }
            
    }
        
}

</script>

<style lang="sass" scoped>
.collection_div
    z-index: 101
    position: relative
    height:0
    top:0
    left:0
    padding-bottom: 900px
    width: 100%
    background-color: #FFD40080
    font-size: 25px
    .collection
        position: relative
        padding-top: 25px
        display: flex
        flex-direction: row
        .title
            line-height: 30px
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
    .shoplist_div
        position: ralative
        height:0
        top:0
        left:0
        border-radius: 30px 30px 0 0
        background-color: #F5F5F5
        padding-bottom: 830px
        margin-top: 20px
        overflow: hidden
        .tips
            font-size: 0.4rem
            margin-top: 0.5rem
            text-align: center
            font-weight: bold
        .shoplist
            padding: 30px
            display: flex
            flex-direction: column
            padding: 0.8rem
            font-size: 0.3rem
            .shop_div
                position: relative
                display: flex
                flex-direction: row
                height: 2.3rem
                width:  6.9rem
                background-color: #fff
                border: solid 1px #FFBD09
                margin-bottom:  0.4rem
                .shop_img   
                    width: 3rem
                    height: 2.3rem
                    overflow: hidden
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
                    padding: 0.4rem
                    .shop_name
                        font-size: 0.35rem
                        margin-bottom: 0.15rem
                    .classification
                        color: #6A6A6A
                        margin-bottom: 0.1rem
                    .rating 
                        display: flex
                        flex-direction: row
                        align-items: center
                        .icon-start
                            margin-right: 0.1rem
                            font-size: 0.4rem
                            line-height: 0.4rem
                            color: #FFBD09
                        .score
                            font-size: 0.33rem
                            line-height: 0.4rem
                        

                
</style>

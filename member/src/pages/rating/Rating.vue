<template>
<div class="rating_div">
    <div class="rating">
        <router-link to="/">
            <div class="back" >
            <span class="material-icons back_arrow">
                navigate_before
            </span>
            </div>
        </router-link>
        <div class="title">評價</div>
    </div>
    <div class="content_div" v-show="goods_rating">
        <div class="content">
            <div class="shop_name">{{shop_name}}</div>
            <div class="rating_shop_div">
                <div class="rating_star">
                    <div class="string">評論店家</div>
                    <q-rating  v-model="shop_rating[0].star"  :max="5" size="0.4rem" color="#FFBD09" />
                </div>
                <div style="margin:25px 0" >
                    <q-input
                    bg-color="white"
                    color= "warning"
                    placeholder="說明..."
                    v-model="shop_rating[0].text"
                    filled
                    type="textarea"
                    />
                </div>
            </div>
            <div class="date">
                訂購時間：
            </div>
            <div class="goods_info_div" v-for="(item,index) in goods" :key="index">
                <div class="goods">
                    <div class="goods_img">
                        <img class="img" :src="'/api/Img/goods/' + item.g_pic + '.jpg'">
                    </div>
                    <div class="goods_name">{{item.g_name}}</div>
                </div>
                <div class="rating_star">
                    <div class="string">評價商品({{item.g_name}})</div>
                    <q-rating  style="flex-shrink:0" v-model="goods_rating[index].star"  :max="5" size="0.4rem" color="#FFBD09" />
                </div>
                <div style="margin:0.2rem 0 0.6rem 0" >
                    <q-input
                    bg-color="white"
                    color= "warning"
                    placeholder="說明..."
                    v-model="goods_rating[index].text"
                    filled
                    type="textarea"
                    />
                </div>
            </div>
            <div class="send_button">
                <div class="send" @click="send">送出</div>
            </div>
        </div>
    </div>
    <q-dialog class="alert" v-model="alert" >
      <q-card class="alert_card">
        <q-card-section>
            <div class=" text-weight-bold">注意</div>
        </q-card-section>
        <q-card-section class="q-pt-none" >
          請完成所有項目的評分
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="OK" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
</div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'RatingOrder',
    data() {
        return {
            goods: [],
            o_num: '',
            user_num:'',
            shop_name: '',
            order_datatime: '',
            shop_rating:[{s_num:'',star:0,text:''}],
            goods_rating: [],
            grade: 0,
            alert: false,
            point: ''
        }
    },
    async mounted(){
        this.user_num = localStorage.getItem('token')
        this.o_num = this.$store.getters.order_num
        await this.rating_order()
        console.log(this.goods_rating)
    },
    methods: {
        async rating_order(){
            await axios.get('/api/member_orderInfo.php',{
            params: {
                order_num: this.o_num
            }
            })
            .then(res => {
                this.goods = res.data
                console.log(this.goods)
                this.shop_name = this.goods[0].s_name
                this.shop_rating[0].s_num = this.goods[0].s_num
                for(var i = 0;i < this.goods.length;i++){
                    this.goods_rating.push({g_num:this.goods[i].g_num,star:0,text:''})
                }
            })

            await axios.get('/api/member_get_user_info.php',{
            params: {
                user_num: this.user_num
            }
            })
            .then(res => {
                this.point = res.data.point
                this.point = parseInt(this.point)
                
            })
            

        },
        send(){
            for(var i =0;i<this.goods_rating.length;i++){
                if(this.goods_rating[i].star==0 || this.shop_rating[0].star == 0){
                    this.alert  = true
                }
                this.point++
            }
            
            if(!this.alert){
                //-----------------------------獲取現在時間
                const d = new Date()
                // Tue Apr 28 2020 13:14:20 GMT+0600 (孟加拉標準時間)
                d.setHours(d.getHours() + 8)
                // Tue Apr 28 2020 21:14:20 GMT+0600 (孟加拉標準時間)
                let dt = d.toJSON().slice(0, 19)
                // 2020-04-28T15:14:20
                let date = dt.replace('T', ' ')
                //---------------------------------
                axios.get('/api/member_rating_goods.php',{
                    params: {
                        date: date,
                        o_num: this.o_num,
                        rating_info: this.goods_rating
                    }
                })
                axios.get('/api/member_rating_shop.php',{
                    params: {
                        date: date,
                        user_num: this.user_num,
                        rating_info: this.shop_rating
                    }
                })

                axios.get('/api/member_update_user_point.php',{
                    params: {
                        user_num: this.user_num,
                        point: this.point
                    }
                })

                this.$router.push('/')
            }
        }
    }
}
</script>

<style lang="sass" scoped>
    .rating_div
        position: relative
        height:0
        top:0
        left:0
        padding-bottom: 900px
        width: 100%
        background-color: #FFD40080
        font-size: 25px
        .rating
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
            border-radius: 30px 30px 0 0
            background-color: #F5F5F5
            padding-bottom: 50px
            margin-top: 20px
            overflow: hidden
            font-size: 0.35rem
            font-weight: bold
            .content
                padding: 0.5rem
                .shop_name 
                    text-align: center
                    font-size: 0.4rem
                    font-weight: bold
                
                .rating_star
                    width: 100%
                    height: 0.8rem
                    background-color: #fff
                    margin: 0.2rem 0 0 0
                    display: flex
                    flex-direction: row
                    align-items: center
                    justify-content: space-between
                    padding: 0.3rem
                
                    
                    
                .date 
                    width: 100%
                    height: 0.8rem
                    background-color: #fff
                    margin: 0.5rem 0
                    display: flex
                    flex-direction: row
                    align-items: center
                    justify-content: space-between
                    padding: 0.3rem
                .goods_info_div
                    display: flex
                    flex-direction: column
                    .goods 
                        display: flex 
                        flex-direction: row
                        width: 100% 
                        height: 2rem
                        overflow: hidden
                        background-color: #fff
                        align-items: center
                        .goods_name 
                            display: flex
                            flex-grow: 2
                            align-self: center
                            margin-left: 1rem
                        .goods_img 
                            width: 2rem 
                            height: 2rem
                            background-color: red
                            .img
                                width: 2rem
                                height: 2rem 
                .send_button
                    display: flex
                    justify-content: center
                .send
                    width: 2rem
                    border-radius: 0.15rem
                    background-color: #FFBD09   
                    font-size: 0.4rem
                    line-height: 0.7rem
                    font-weight: bold    
                    text-align: center 
                    color: #fff
                    

            
                
    </style>
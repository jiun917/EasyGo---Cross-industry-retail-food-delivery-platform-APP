<template>
    <div class="orderfinish" v-show="issubmit">
        <div class="finish_info" >
            <router-link to="/">
                <span class="material-icons cancle_icon" @click="orderclear">
                    cancel
                </span>
            </router-link>
            <div class="check">
                <div class="check_icon" v-show="making_time">
                    <span class="material-icons " >
                        check_circle_outline
                    </span>
                </div>
                <div class="q-pa-md flex flex-center" v-show="!making_time">
                    <q-circular-progress
                    indeterminate
                    size="100px"
                    color="Warning"
                    class="q-ma-md"
                    ></q-circular-progress>
                </div>
            </div>
            <div class="finish_word">
                訂單已送出
            </div>
            <div class="order_info" v-show="making_time">
                <div class="shop_name">店家名稱:{{shop_name}}</div>
                <div class="making_time">製作時間:{{making_time}}分鐘</div>
                <div class="finish_time">預計取餐時間:{{take_meal_time}} </div>
            </div>
            <div class="design" v-show="making_time">
                <div class="circle1"></div>
                <div class="divider"></div>
                <div class="circle2"></div>
            </div>
            <div class="total_price" v-show="making_time">
                <div class="total">總金額</div>
                <div class="price">${{total-usepoint}}</div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'OrderFinish',
    props:{
        issubmit: Boolean,
        total: Number,
        usepoint: Number,
        shop_name:String,
        making_time: Number,
        take_meal_time: String
    },
    methods:{
        orderclear(){
            var order = []
            this.$store.dispatch('getOrder',order)
        }
    }
}
</script>
 
<style lang="sass" scoped>
    .orderfinish
        position: absolute
        top:0
        right: 0
        left: 0
        height: 0
        padding-bottom: 216%
        background-color: #D3D3D3	
        z-index: 101
        .finish_info
            position: absolute
            width: 6.24rem
            height: 13.1rem
            top: 0         
            bottom: 0     
            left: 0    
            right: 0
            margin: auto 
            background-color: #fff
            .cancle_icon
                position: absolute
                right: 0
                font-size: 0.5rem
                color: #FFBD09
            .check
                display: flex 
                flex-direction: column
                align-items: center
                margin: 0.7rem auto
                font-size: 4rem
                color: #FFBD09
                
                    
            .finish_word
                text-align: center    
                font-size: 0.5rem
                font-weight: bold
                color: #FFBD09
                margin: 0 1.2rem 0.5rem 1.2rem
            .order_info
                text-align: center
                font-size: 0.35rem
                font-weight: bold
                .shop_name,.making_time,.finish_time
                    margin-bottom: 0.3rem
            .design
                position: relative
                display: flex
                flex-direction: row
                height: 2.5rem
                justify-content: center
                align-items: center
                .divider
                    border: 0.01rem solid #D3D3D3
                    width: 3.5rem
                    background-color: #D3D3D3
                .circle1,.circle2
                    height: 2rem
                    width: 2rem
                    background-color: #D3D3D3
                    border-radius: 50%
                .circle1
                    position: absolute
                    left: -1rem
                .circle2
                    position: absolute
                    right: -1rem
            .total_price
                position: relative
                display: flex
                flex-direction: column
                align-items: center
                font-size: 0.35rem
                font-weight: bold
                .price
                    margin-top: 0.2rem
                    color: #FFBD09
            
                

                

</style>
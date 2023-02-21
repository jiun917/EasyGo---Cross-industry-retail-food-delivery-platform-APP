<template>
<transition name="fold">
    <div class="goods" v-show="isselectgoods">
        <div class="goods_header">
            <div class="goods_img_div">
                <img v-if="goodsItem.g_pic" class="goods_img" :src="'/api/Img/goods/' + goodsItem.g_pic + '.jpg'">
            </div>
            <div class="close">
                <span class="material-icons"  @click="isgoback()">
                    close
                </span>
            </div>
        </div>
        <div class="goods_detail">
            <div class="goods_detail_header">
                <div class="goods_">{{goodsItem.g_name}}</div>
                <div class="goods_price">${{goodsItem.g_price}}</div>
            </div>
            <div class="divider"></div>
            <div class="goods_select_list">
                <q-form @submit="onSubmit" class="q-gutter-md form">
                    <div class="shopcart">
                        <div class="decrease" :class="{noclick:goodscount<=1}" @click="cutgoodsconut">
                            <span class="material-icons">
                                remove_circle_outline
                            </span>
                        </div>
                        <div class="goodscount"  >
                            {{goodscount}}
                        </div>
                        <div class="increase"  @click="addgoodsconut">
                            <span class="material-icons">
                                add_circle_outline
                            </span>
                        </div>
                        <q-btn class="shopcart_btn" label="加到購物車" type="submit" color="yellow" @click="addShopname" />
                        <q-dialog v-model="inception">
                        <q-card>
                            <q-card-section>
                                <div class="text-bold">要清除已選購的商品嗎?</div>
                            </q-card-section>

                            <q-card-section class="q-pt-none">
                                你已選擇了不同店家，如要繼續將會清空購物車的商品
                            </q-card-section>

                            <q-card-actions align="right" class="text-warning">
                            <q-btn class="text-bold" flat label="刪除" @click="clearorder" />
                            <q-btn class="text-bold" flat label="取消" v-close-popup />
                            </q-card-actions>
                        </q-card>
                        </q-dialog>
                    </div>
                </q-form>
            </div>
        </div>
    </div>
</transition>
</template>

<script>
export default {
    name: 'ShopGoods',
    data() {
        return{
            goback: false,
            submitEmpty: false,
            alert: false,
            selected: [],
            goodscount: 1,
            order:[],
            inception: false
        }
    },
    props: {
        goodsItem: Object,
        isselectgoods: Boolean,
        shop_name: String
    },
   mounted(){
    if(this.$store.getters.order){
            this.order=this.$store.getters.order
            this.shopcartnum=this.order.length
    }
    
    
   },   
    methods: { 
        isgoback() {
            this.goodscount=1
            this.$emit("addshopcart",this.order) 
        },
        onSubmit() {
            if(this.$store.getters.shop_name == this.shop_name || this.$store.getters.shop_name == '' || this.$store.getters.order.length==0){
                this.$store.dispatch('getaddshop_name',this.shop_name)
                const info = {num:this.goodsItem.g_num,name:this.goodsItem.g_name,quantity:this.goodscount,price:this.goodsItem.g_price}
                this.order.push(info)
                this.info = []
                this.goodscount = 1
                this.$emit("addshopcart",this.order) 
            }
            else{
                this.inception = true
            }
        },
        addgoodsconut() {
            this.goodscount++
        },
        cutgoodsconut() {
            if(this.goodscount>1)
                this.goodscount--
        },
        addShopname() {
            if(!this.$store.getters.shop_name)
                this.$store.dispatch('getaddshop_name',this.shop_name)
        },
        clearorder(){
            this.inception = false
            this.$store.dispatch('getaddshop_name',this.shop_name)
            this.order=[]
            const info = {num:this.goodsItem.g_num,name:this.goodsItem.g_name,quantity:this.goodscount,price:this.goodsItem.g_price}
            this.order.push(info)
            this.info = []
            this.goodscount = 1
            this.$emit("addshopcart",this.order) 
        }
    }
        
}
</script>

<style lang="sass" scoped>
    .fold-enter-active,.fold-leave-active
        transition: 0.5s
    .fold-enter, .fold-leave-to
        transform: translateY(100%)
    .goods
        position: absolute
        top: 0
        left: 0
        background-color: #fff
        z-index: 101
        width: 100%
        height:18rem
        .goods_header
            margin: 0.1rem
            .goods_img_div
                display: flex
                height: 4.86rem
                overflow: hidden
                .goods_img
                    width: 100%
                    height: 4.86rem
                    border-radius: 1rem
                    object-fit: cover
            .close
                position: fixed
                top:0
                left:0
                margin: 0.5rem
                border-radius: 100%
                width:0.78rem
                height: 0.78rem
                background-color: #fff
                .material-icons
                    position: absolute
                    top: 50%
                    left: 50%
                    transform: translate(-50%,-50%)
                    font-size: 0.5rem
                    color: #000
        .goods_detail          
            .goods_detail_header
                padding: 0.5rem 0.5rem
                display: flex
                flex-direction: row
                justify-content: space-between
                font-size: 0.5rem
                font-weight: bold
                color: #FFBD09
            .divider 
                height: 0.05rem
                background-color: #A9A9A9
            .goods_select_list
                margin: 0.5rem
                .form
                    .shopcart
                        position: relative
                        display: flex 
                        flex-direction: row
                        align-content: center
                        .increase,.decrease
                            font-size: 0.6rem
                            color: #FFBD09
                            margin-right: 0.3rem
                            &.noclick
                                color: #C0C0C0
                        .goodscount
                            margin-right: 0.3rem
                            font-size: 0.4rem
                            align-self: center
                        .shopcart_btn
                            align-self: center
                            position: absolute
                            right: 0
                            font-weight: bold
                      
                            
                .listname
                    font-size: 0.4rem
         

    

    
            
</style>
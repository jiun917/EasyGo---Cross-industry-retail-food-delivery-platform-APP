<template>
  <div class="home">
      <home-header :user_info="user_info"></home-header>
      <home-ad> </home-ad>
      <home-shoplist :shop_data="shop_data" :shop_rating="shop_rating" :recommend_shop="recommend_shop" ></home-shoplist>
      <home-dock></home-dock>
  </div>
</template>

<script>
import HomeHeader from './components/Header.vue'
import HomeAd from './components/Ad.vue'
import HomeShoplist from './components/Shoplist.vue'
import HomeDock from '../components/Dock.vue'
import axios from 'axios'
export default {
    name:'HomePage',
    data() {
      return {
        shop_data: [],
        shop_rating:[],
        user_num:'',
        user_info:{},
        recommend_shop:[]
      }
    },
    components: {
      HomeHeader,
      HomeAd,
      HomeShoplist,
      HomeDock
    },
    methods:{
      async getdata(){
        await axios.get('/api/member_homepage_shop_info.php')
        .then(res => {
          this.shop_data = res.data
          console.log(this.shop_data)
        })
      },
      async get_recommend(){
        await axios.get('/api/Python/CF/cf.php',{
          params: {
            user_num: this.user_num
          }
          })
          .then(res => {
            this.recommend_shop = res.data
            console.log(this.recommend_shop)
          })
      },
      async getuser(){
        console.log(this.user_num)
        await axios.get('/api/member_get_user_info.php',{
          params: {
            user_num: this.user_num
          }
          })
          .then(res => {
            this.user_info = res.data
            this.$store.dispatch('getuserpoint',this.user_info.point)
          })
      },
      async getshop_rating(){
        this.shop_data.forEach( value => {
          this.shop_rating.push(parseInt(value.s_rating))
        });
      }
    },
    async mounted() {
      this.user_num = localStorage.getItem('token')
      await this.getdata()
      await this.get_recommend()
      await this.getuser()
      await this.getshop_rating()
      
    }
}
</script>

<style lang="sass" scoped>
  
</style>
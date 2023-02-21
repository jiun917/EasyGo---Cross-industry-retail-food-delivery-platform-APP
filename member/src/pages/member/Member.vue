<template>
  <div class="Member" v-show="MemberPage">
    <div class="header_div">
      <div class="header">
        <div class="header_left">
          <div class="avatar">
            <img v-if="personal_data.avatar" class="shop_img" :src="'/api/Img/user/' + personal_data.avatar + '.jpg'">
          </div>  
        </div>
        <div class="header_right">
          <div class="name">{{personal_data.name}}</div>
          <div class="Coin">
            <span class="material-icons coin_icon">
              monetization_on
            </span>
            {{personal_data.point}}</div>
          </div>
      </div>
    </div>
    <div class="list_div">
      <div class="list">
        <div class="personal_information_div" @click="click_personal_info">
          <span class="material-icons">
            account_box
          </span>
          <div class="word">
            個人資料
          </div>
          <span class="material-icons right_alt">
            arrow_right_alt
          </span>
        </div>
        <div class="collect_shop_div" @click="click_collect_shop">
          <span class="material-icons" >
            favorite
          </span>
          <div class="word">
            收藏店家
          </div>
          <span class="material-icons right_alt">
            arrow_right_alt
          </span>
        </div>
        <router-link to="Point">
          <div class="point_div">
            <span class="material-icons">
              monetization_on
            </span>
            <div class="word">
              點數
            </div>
            <span class="material-icons right_alt">
              arrow_right_alt
            </span>
          </div>
        </router-link>
        <router-link to="OrderHistory">
          <div class="order_history_div">
          <span class="material-icons">
            history
          </span>
          <div class="word">
            歷史訂單
          </div>
          <span class="material-icons right_alt">
            arrow_right_alt
          </span>
          </div>
        </router-link>
        <div class="logout_button">
          <div class="logout" @click="logout">登出</div>
        </div>
      </div>
    </div>
  </div>
  <member-dock v-show="MemberPage"></member-dock>
  <personal-information :PersonalInfoPage="PersonalInfoPage" :personal_data="personal_data" @goback="goback"></personal-information>
  <collection-shop :CollectionShopPage="CollectionShopPage"   @goback="goback"></collection-shop>
  
</template>

<script>
import MemberDock from '../components/Dock.vue'
import PersonalInformation from './components/PersonalInformation.vue'
import CollectionShop from './components/CollectionShop.vue'
import axios from 'axios'

export default {
    name: 'MemberPage',
    data(){
      return{
        page: '',
        MemberPage: true,
        PersonalInfoPage: false,
        CollectionShopPage: false,
        personal_data: {},
        user_num:''
      }
    },
    components:{
      MemberDock,
      PersonalInformation,
      CollectionShop,
     
    },
    mounted(){
      this.user_num = localStorage.getItem('token')
      axios.get('/api/member_get_user_info.php',{
        params: {
          user_num: this.user_num
        }
        })
        .then(res => {
          this.personal_data = res.data
          
        })
    },
    methods: {
      click_personal_info(){
        this.MemberPage = false
        this.PersonalInfoPage = true
      },
      click_collect_shop(){
        this.MemberPage = false
        this.CollectionShopPage = true
      },
      goback(page){
        this.MemberPage = true
        if(page == 'PersonalInfoPage'){
          this.PersonalInfoPage = false
        }else if(page == 'CollectionShopPage'){
          this.CollectionShopPage = false
        }
      },
      logout(){
        localStorage.clear()
        this.$router.push('/login')
      }
    }
    
}
</script>

<style lang="sass" scoped>
  .Member
    position: relative
    height: 0
    left: 0
    right: 0
    width: 100%
    padding-bottom: 200%
    margin-bottom: 1.42rem
    background-color: #F5F5F5
    .header_div
      padding: 0.7rem 0.46rem
      .header
        border-radius: 0.3rem
        display: flex
        flex-direction: row
        flex-grow: 0
        height: 2.6rem
        background-color: #FFD40080
        align-items: center
        .header_left
          margin: 0 0.3rem
          .avatar
            width: 1.6rem
            height: 1.6rem
            border-radius: 50%
            text-align: center
            .shop_img
              width: 1.6rem
              height: 1.6rem
              border-radius: 50%
        .header_right
          display: flex
          flex-direction: column
          
          .name
            margin-bottom: 0.25rem
            font-size: 0.6rem
          .Coin
            display: flex
            align-items: center
            font-size: 0.45rem
            font-weight: bold
            .coin_icon
              color: #FF7300
              margin-right: 0.1rem
          .point
            font-size: 0.4rem
    .list_div
      padding: 0.72rem 0.78rem
      .logout_button
        display: flex
        justify-content: center
        .logout
          width: 2rem
          border-radius: 0.15rem
          background-color: #FFBD09   
          font-size: 0.4rem
          line-height: 0.7rem
          font-weight: bold    
          text-align: center 
          color: #fff
      .personal_information_div,.collect_shop_div,.point_div,.order_history_div
        position: relative
        border-radius: 0.3rem
        height: 1.6rem
        border: solid 0.01rem #FFBD09
        background-color: #fff
        margin-bottom: 0.68rem
        padding: 0.3rem
        display: flex
        align-items: center
        font-size: 0.4rem
        font-weight: bold
        color: 	#808080
        .material-icons
          font-size: 1rem
          color: #FFD400
          margin-right: 0.3rem
        .right_alt
          position: absolute
          right: 0
        
        
        
        
      
      


</style>
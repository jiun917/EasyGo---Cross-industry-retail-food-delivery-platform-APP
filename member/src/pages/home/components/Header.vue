<template>
      <div class="title" >
          <div class="logo">
              <img class="logo-img" src="/api/Img/AppLogo.png">
          </div>
          <div class="name">
             Hello {{user_info.name}}
          </div>
  
          <div class="user">
              <img v-if="user_info.avatar" class="user-img" :src="'/api/Img/user/'+user_info.avatar+'.jpg'">
          </div>
          <router-link to="/search">
            <div class="input">
                <q-input class="input-search" bg-color="white" dense rounded outlined  disable label="搜尋餐廳"   >
                    <template v-slot:append>
                        <q-icon name="search" />
                    </template>
                </q-input>
            </div>
          </router-link>
      </div>
</template>

<script>
export default {
    name:'HomeHeader',
    props: {
        user_info: Object
    }
  
}
</script>

<style lang="sass" scoped>
    .title
        position: relative
        top: 0
        height: 4.12rem
        background-color: #FFD40080

        .logo 
            position: absolute 
            top: -0.3rem
            left: 0.1rem
            width: 1.91rem 
            height: 1.5rem
            .logo-img 
                width: 150px
                height: 150px
        .name 
            position: absolute
            top: 2.2rem
            left: 0.28rem
            font-size: 0.5rem
            font-weight: bold
        .icon
            position: absolute
            right: 0.26rem
            top:0.4rem
            .material-icons
                font-size: 0.6rem
                color: rgba(0,0,0,0.4)
            .circle 
                position: absolute
                border: solid 0.1rem red
                border-radius: 100%
                right: 0
                top: 0
        .user 
            position: absolute 
            border: solid 0.01rem white
            border-radius: 50%
            top: 1.38rem
            right: 0.52rem
            overflow: hidden
            width:79px
            height: 76px
            .user-img
                width:79px
                height: 76px
        .input 
            position: absolute 
            top: 3.1rem 
            right: 0.14rem
            left: 0.14rem
           
    
</style>
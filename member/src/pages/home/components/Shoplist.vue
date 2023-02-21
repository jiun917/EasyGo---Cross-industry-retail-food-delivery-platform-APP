<template>
  <div class="recommend">
    <div class="title">熱門店家</div>
    <swiper 
    :slidesPerView="2"
    :spaceBetween="100"
    > 
    <swiper-slide v-for="(item,index) in shop_data" :key="index">
        <!-- <router-link to="/shop"> -->
          <div class="q-pa-md  items-start q-gutter-md" >
            <q-card class="my-card">
              <div style="width:100%;height:150px;overflow:hidden;" @click="send_num(item.s_num)" >
                <img :src="'/api/Img/shop/' + item.s_pic + '.jpg'" style="width:100%;height:150px;" />
              </div>
              <q-separator />
              <q-card-section >
                  <q-btn
                  round
                  color="yellow"
                  icon="place"
                  class="absolute"
                  style="top: 0; right: 0.24rem; transform: translateY(-80%)"
                  @click="click_map"
                  />
                <div class="row no-wrap items-center" @click="send_num(item.s_num)">
                  <div class="col  ellipsis  shop_name">
                    {{item.s_name}}
                  </div>
                  <div class="col-auto text-grey  items-center">
                    5km
                  </div>
                </div>
                <div class="row rating" @click="send_num(item.s_num)" >
                  <span v-show="!item.s_rating" style="color:black;font-weight: 400;">還未有評價</span>
                  <span v-show="item.s_rating" class="grade">{{item.s_rating}}.0</span>
                  <q-rating v-if="rating" v-show="item.s_rating" v-model=item.s_rating :max="5" size="0.4rem" color="#FFD400" readonly  />
                </div>
                <div class="text-grey ellipsis /" @click="send_num(item.s_num)">
                  {{item.s_slogan}}
                </div>
              </q-card-section>
            </q-card>
          </div>
        <!-- </router-link> -->
      </swiper-slide>
    </swiper>
  </div>

  <div class="divider"></div>

  <div class="popular">
    <div class="title">專屬你的推薦</div>
    <swiper 
    :slidesPerView="2"
    :spaceBetween="100"
    > 
    <swiper-slide v-for="(item,index) in recommend_shop" :key="index">
        <!-- <router-link to="/shop"> -->
          <div class="q-pa-md  items-start q-gutter-md" >
            <q-card class="my-card">
              <div style="width:100%;height:150px;overflow:hidden;" @click="send_num(item.s_num)">
                <img :src="'/api/Img/shop/' + item.s_pic + '.jpg'" style="width:100%;height:150px;" />
              </div>
              <q-separator />
              <q-card-section >
                  <q-btn
                  round
                  color="yellow"
                  icon="place"
                  class="absolute"
                  style="top: 0; right: 0.24rem; transform: translateY(-80%)"
                  @click="click_map"
                  />
                <div class="row no-wrap items-center" @click="send_num(item.s_num)">
                  <div class="col  ellipsis  shop_name">
                    {{item.s_name}}
                  </div>
                  <div class="col-auto text-grey  items-center">
                    5km
                  </div>
                </div>
                <div class="row rating" @click="send_num(item.s_num)" >
                  <span v-show="!item.s_rating" style="color:black;font-weight: 400;">還未有評價</span>
                  <span v-show="item.s_rating" class="grade">{{item.s_rating}}.0</span>
                  <q-rating v-if="rating" v-show="item.s_rating" v-model=item.s_rating :max="5" size="0.4rem" color="#FFD400" readonly  />
                </div>
                <div class="text-grey ellipsis /" @click="send_num(item.s_num)" >
                  {{item.s_slogan}}
                </div>
              </q-card-section>
            </q-card>
          </div>
        <!-- </router-link> -->
      </swiper-slide>
    </swiper>
    </div>
</template>
<script>
  import { Swiper, SwiperSlide } from 'swiper/vue'
  import 'swiper/css'

  export default {
      name: 'HomeShop',
      components: {
        Swiper,
        SwiperSlide
      },
      data () {
        return {
          rating: [1,1,1,1,1,1],
          start: 5
        }
      },
      props: {
        shop_data: Array,
        shop_rating: Array,
        recommend_shop: Array
      },
      created(){
        this.rating = this.shop_rating
      },
      methods: {
        send_num(num) {
          this.$store.dispatch('getaddshop_num',num)
          this.$router.push('/shop')
        },
        click_map(){
          console.log('aa')
          this.$router.push('/map')
        },
      },
      
  }
</script>

<style lang="sass" scoped>
  .recommend,.popular
    position: relative
    width: 100%
    height: 5.68rem
    font-weight: bold
    &.popular
      display: inline-block
      margin-bottom: 1.45rem
   
    .title 
        font-size: 0.45rem
        margin: 0.2rem 0 0 0.3rem
        color: #333
    .my-card
        height: 4.7rem 
        width: 4.7rem
        .shop_name
          font-weight: bold
          color: #000
          font-size: 0.4rem
          margin-bottom: 0.1rem
        .rating
            align-items: center
            font-weight: bold
            font-size: 0.3rem
            margin-bottom: 0.1rem
            .grade 
                margin-right: 0.05rem
                color: black
  .divider 
    height: 0.14rem
    background-color: #F2F2F2
</style>
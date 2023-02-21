<template>
<div class="ad">
    <div class="q-pa-md">
      <q-carousel
      swipeable
      height="3.5rem"
      animated
      v-model="slide"
      navigation
      infinite
      :autoplay="autoplay"
      transition-prev="slide-right"
      transition-next="slide-left"
      @mouseenter="autoplay = false"
      @mouseleave="autoplay = true"
    >
      <q-carousel-slide :name="1" img-src="/api/Img/carousel/carousel_1_pic.png" />
      <q-carousel-slide :name="2" img-src="/api/Img/carousel/carousel_2_pic.png" />
      <q-carousel-slide :name="3" img-src="/api/Img/carousel/carousel_3_pic.png" />
      <q-carousel-slide :name="4" img-src="/api/Img/carousel/carousel_4_pic.png" />
    </q-carousel>
  </div>
</div>
<div class="divider">
</div>
</template>

<script>
export default {
    name:'HomeAd',
    data () {
        return {
            slide: 1,
            autoplay: true
        }
    }
}
</script>

<style lang="sass" scoped>
    .ad 
        position: relative
        height: 0 
        padding-bottom: 53.94%
    .divider 
        height: 0.14rem
        background-color: #F2F2F2
</style>
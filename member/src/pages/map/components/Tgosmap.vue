<template>
  <div
    id="OMap"
    class="tgosmap"
  ></div>
  <div id="point"></div>
  <div class="q-pa-md q-gutter-sm shop_info">
    <q-dialog v-model="seamless"  full-height position="bottom">
      <q-card class="my-card card" >
      <img class="img" :src="'/api/Img/shop/' + this.shop_data.s_pic + '.jpg'" style="height:5rem">
        <q-card-section>
          <div class="row no-wrap items-center">
            <div class="col  ellipsis" style="font-size: 0.4rem;font-weight: bold">
              {{shop_data.s_name}}
            </div>
            <div class=" row no-wrap items-center" style="font-size:0.35rem;font-weight: bold">
              {{shop_data.s_rating}}
              <q-icon name="star" style="color:#FFD400;margin-left: 0.1rem" />
            </div>
          </div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          <div class="text-grey">
            {{shop_data.s_slogan}}
          </div>
        </q-card-section>

        <q-separator />

        <q-card-actions align="right">
          <q-btn @click="to_shop_page(shop_data.s_num)" size="12px" style="background-color:#FFBD09;color:white">
            <q-icon left  name="local_grocery_store" />
            <div style="font-size:0.25rem;font-weight:bold">前往選購</div>
          </q-btn>
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import axios from 'axios'


export default {
  name: "MapTgos",
  data () {
    return {
      img:"https://api.tgos.tw/TGOS_API/images/marker2.png",
      location: null,
      twd97x: null,
      twd97y: null,
      shop_location: [],
      seamless: false,
      shop_data:''
    }
  },
  methods: {
    InitWnd() {
      
      /* eslint-disable */
      var imgUrl = "https://api.tgos.tw/TGOS_API/images/marker2.png";
      var shop_num = null;
      var label = null;
      var labels = new Array();
      var pMap;
      var markerPoint = new TGOS.TGPoint( this.twd97x,this.twd97y );
      var pOMap = document.getElementById("OMap");
      var mapOptiions = {
        scaleControl: false, //不顯示比例尺
        navigationControl: true, //顯示地圖縮放控制項
        navigationControlOptions: {
          //設定地圖縮放控制項
          controlPosition: TGOS.TGControlPosition.TOP_LEFT, //控制項位置
          navigationControlStyle: TGOS.TGNavigationControlStyle.SMALL, //控制項樣式
        },
        mapTypeControl: false, //不顯示地圖類型控制項
      };
      pMap = new TGOS.TGOnlineMap(pOMap, TGOS.TGCoordSys.EPSG3826, mapOptiions); //建立地圖,選擇TWD97坐標
      pMap.setZoom(8); //初始地圖縮放層級
      pMap.setCenter(markerPoint); //初始地圖中心點

      
      for(var i = 0;i<this.shop_location.length;i++){
        var shopPoint = new TGOS.TGPoint(this.shop_location[i].s_longitude,this.shop_location[i].s_latitude)
        var img  = '/api/Img/shop/' + this.shop_location[i].s_logo + '.png'
        var markerImg = new TGOS.TGImage(img, new TGOS.TGSize(50,45), new TGOS.TGPoint(0, 0), new TGOS.TGPoint(20, 55));	//設定標記點圖片及尺寸大小
			  var pTGMarker = new TGOS.TGMarker(pMap, shopPoint,this.shop_location[i].s_num, markerImg);
        

        var labelOpts = {
          map:pMap,
          fontColor: "#FF4500",		//字型顏色
					fontSize: 15,		//字體大小
					fontWeight: "bold",	//字體粗細
					position: shopPoint,											//註記位置
					label: this.shop_location[i].s_name
        };
        label = new TGOS.TGLabel(labelOpts);
        labels.push(label);

        TGOS.TGEvent.addListener(pTGMarker, 'click', function(e) {
          shop_num = e.target.title
          document.getElementById("point").innerHTML = shop_num;
        })
        TGOS.TGEvent.addDomListener(pTGMarker,'click',this.clickpoint)
      }

      var markerImg = new TGOS.TGImage(imgUrl, new TGOS.TGSize(38,33), new TGOS.TGPoint(0, 0), new TGOS.TGPoint(10, 33));
      var pTGMarker = new TGOS.TGMarker(pMap,new TGOS.TGPoint(this.twd97x,this.twd97y),'', markerImg);
      
      // TGOS.TGEvent.addListener(pTGMarker, 'click', this.clickpoint)
    },
    async get_shopdata(){
            await axios.get('/api/member_tgos_shop.php')
            .then(res => {
                this.shop_location = res.data
                console.log(this.shop_location)
            })
    },
    clickpoint () {
      console.log('a')
      this.seamless = true
      this.shop_num = document.getElementById("point").innerText
      console.log(this.shop_num)
      if(this.shop_num){
        axios.get('/api/member_tgos_get_shop_info.php',{
        params: {
          shop_num: this.shop_num
        }
        })
        .then(res => {
          this.shop_data = res.data
          console.log(this.shop_data)
        })
      }
    },
    async getLocation() {
      return new Promise((resolve, reject) => {
        navigator.geolocation.getCurrentPosition(position => {
          resolve(position);
        }, err =>{
          reject(err);
        })
      })
    },
    async locateMe() {
      try{
        this.location = await this.getLocation()
        this.latitude = this.location.coords.latitude
        this.longitude = this.location.coords.longitude
        
      } catch(e) {
        console.log("error")
        console.log(e)
      }
    },
    changelocation() {
      
      var changeinfo = new TGOS.TGTransformation()
      changeinfo.wgs84totwd97(this.location.coords.longitude,this.location.coords.latitude)
      this.twd97x = changeinfo.transResult.x
      this.twd97y = changeinfo.transResult.y

    },
    to_shop_page(num){
      this.$store.dispatch('getaddshop_num',num)
      this.$router.push('/shop')
    }
  },

  async mounted() {
     await this.get_shopdata()
     await this.locateMe()
     await this.changelocation()
     await this.InitWnd()
  }
}
</script>

<style lang="sass" scoped>
  .tgosmap
    position: absolute 
    width: 100%
    height: 100%
    top: 0
    left: 0
  
    
</style>
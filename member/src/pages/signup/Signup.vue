<template>
    <div class="signup_div">
        <div class="signup_top">
            <div class="title">EASYGO逸利購</div>
        </div>
        <div class="signup_bottom" v-show="SignupPage">
            <p class="signup_title">會員註冊</p>
            <q-input class="account" color="yellow" v-model="account" placeholder="帳號" type="email">
                <template v-slot:prepend>
                    <q-icon name="account_circle" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
                </template>
            </q-input>
            <q-input class="password" color="yellow" v-model="password" placeholder="密碼" type="password">
                <template v-slot:prepend>
                    <q-icon name="lock" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
                </template>
            </q-input>
            <q-input class="password" color="yellow" v-model="password_check" placeholder="再次輸入密碼" type="password">
                <template v-slot:prepend>
                    <q-icon name="lock" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
                </template>
            </q-input>
            <div @click="photo" class="face">
                <q-input  color="yellow" v-model="face_recognition" placeholder="請進行人臉辨識"   readonly >
                <template v-slot:append>
                    <q-icon name="face" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
                </template>
                </q-input>
            </div>
            <input ref="file" type="file" accept="image/*" capture="user" style="display:none" @change="selectPhoto($event)">

            <!-- <canvas class="canvas" width="320" height="240" ref="canvas" v-show="istakephoto"></canvas>
            <video ref="video" v-show="isphoto"  width="320" height="240" ></video>
                
            <div class="photo_button">
                <button class="button" @click="resetPhoto" v-show="istakephoto">重新拍攝</button>
                <button class="button" @click="surePhoto" v-show="istakephoto">確定</button>
                <button class="button" @click="takePhoto" v-show="isphoto">拍照</button>
            </div> -->
            
            <div class="err_msg">{{msg}}</div>
            <div class="signup_btn" @click="signup">註冊</div>
            <router-link to="login">
                <div class="login" @click="stopPhoto">返回登入</div>
            </router-link>
        </div>
        <q-dialog v-model="alert">
            <q-card>
                <q-card-section>
                    <div class="text-bold">無法進行註冊</div>
                </q-card-section>

                <q-card-section class="q-pt-none">
                    你因個人行為，已被本平台視為黑名單
                </q-card-section>
                <q-card-actions align="right">
                    <q-btn @click="click_alert" flat label="OK" color="primary" v-close-popup />
                </q-card-actions>
            </q-card>
        </q-dialog>
        <personal-data :PersonalDataPage="PersonalDataPage" :account="account"></personal-data>
    </div>

    </template>
    
    <script>
    import axios from 'axios'
    import PersonalData from './components/PersonalData.vue'
    
    export default {
        name:'SignupPage',
        components:{
            PersonalData
        },
        data(){
            return{
                SignupPage: true,
                PersonalDataPage: false,
                account: '',
                password: '',
                password_check:'',
                face_recognition:'',
                msg:'',
                state: false,
                // isphoto: false,
                // istakephoto:false,
                dataURL: null,
                track: null,
                face_check: '',
                alert: false
            }
        },
        methods:{
            async signup(){
                if(this.password == this.password_check){
                    console.log('passwordsame')
                    await axios.get('/api/member_signup.php',{
                    params: {
                        account: this.account,
                        password: this.password
                    }
                    })
                    .then(res => {
                        console.log(res.data)
                        this.msg = res.data.msg
                        this.state = res.data.ok
                    })
                }else{
                    
                    this.msg="請輸入相同的密碼"
                }
    
                if(this.state==true){
                    console.log(this.account)
                    this.SignupPage = false
                    this.PersonalDataPage = true
                }
            },
            selectPhoto(el){
                var file = el.target.files[0]
                var type = file.type.split('/')[0]
                if(type === "image"){
                    var reader = new FileReader()
                    reader.readAsDataURL(file)
                    reader.onload = async () => {
                        var image = reader.result
                        this.dataURL = image
                        console.log(this.dataURL)
                        axios.post('/api/Python/face/test01.php',{
                            img: this.dataURL
                        }).then(res =>{
                            console.log(res.data)
                            this.face_check = res.data
                            if(this.face_check==0){
                                this.face_recognition = "完成人臉辨識"
                            }else if(this.face_check==1){
                                this.face_recognition = "你是黑名單無法註冊"
                                this.alert = true
                            }else if(this.face_check==""){
                                this.face_recognition = "請對準臉部進行辨識"
                            }
                        })
                    }                     
                }
                
                // var file = this.$refs["file"].file[0]
                // let content = null
                // var readfile = new FileReader()
                // if(file != undefined){
                //     content = readfile.readAsDataURL(file, "UTF-8")
                //     console.log(content)
                //     readfile.onload = function(event){
                //         content = event.target.result
                //         let blod = this.base64ToFile(content,new Date().getTime()+".png")
                //         this.account = blod
                //     }
                // }
            },
            photo(){
                this.$refs["file"].click()
                // this.isphoto = true
                // let mediaDevices = navigator.mediaDevices.getUserMedia({audio: false,video:{width: 320,height: 240} })
                // mediaDevices
                //  .then(mediaStream  => {
                //     this.$refs["video"].srcObject = mediaStream; //srcObject 是实时流
                //     // 实时拍照效果
                //     this.$refs["video"].play();
                    
                //  })
                //  .catch(err => {
                //     console.log("err_msg" + err.name)
                //  })
            },
            // takePhoto(){
            //     let photoInfo = this.$refs["canvas"].getContext("2d");
            //     photoInfo.drawImage(this.$refs["video"], 0, 0, 320, 240)
            //     this.dataURL = this.$refs["canvas"].toDataURL("image/jpeg");
                
                
            //     this.istakephoto = true
            //     this.isphoto = false
            // },
            // resetPhoto(){
            //     this.isphoto = true
            //     this.istakephoto = false
            // },
            // surePhoto () {
            //     this.face_recognition = "你是黑名單無法註冊!!!"
            //     console.log(this.dataURL)
                
            // },
            // stopPhoto () {
            //     this.$refs["video"].srcObject.getTracks()[0].stop()
            
            // },
            click_alert()
            {
                this.$router.push('/login')
            }
            
        }
        
        
    }
    </script>
    
    <style lang="sass" scoped>
        .signup_div
            position: absolute
            height:0
            top:0
            left:0
            padding-bottom: 900px
            width: 100%
            background-color: #FFD40080
            .signup_top
                .title
                    font-size: 0.5rem
                    line-height: 1.5rem
                    text-align: center
            .signup_bottom
                position: relative
                height:0
                top:0
                left:0
                background-color: #fff
                padding: 40px 30px 820px 20px
                overflow: hidden
                .signup_title
                    font-size: 0.5rem
                    font-weight: bold
                .account
                    margin-top: 0.5rem
                .password 
                    margin-top: 0.5rem
                .face 
                    margin-top: 0.5rem
                .signup_btn
                    margin: 0 auto
                    margin-top: 2rem
                    width: 5rem
                    line-height: 1.1rem
                    background-color: #FFBD09
                    border-radius: 0.4rem
                    text-align: center
                    font-size: 0.35rem
                    font-weight: bold
                    color: #fff
                .face_recognition
                    position: absolute
                    width: 5rem
                    background-color: #FFBD09
                    border-radius: 0.2rem
                    text-align: center
                    line-height: 0.6rem
                .login
                    margin-top: 0.2rem
                    text-align: center
                .err_msg
                    color: red
                    margin-top: 0.2rem
                    text-align: center
                .photo
                    display: flex 
                    flex-direction: column
                    align-items: center
                    .take_photo 
                        width: 1.5rem
                        height: 0.5rem
                        background-color: #FFBD09
                .photo_button
                    display: flex 
                    flex-direction: row
                    justify-content: space-around 
                    align-items: center
                    .button
                        margin-top: 0.2rem
                        width: 2rem
                        line-height: 0.5rem
                        background-color: #FFBD09
                        border-radius: 0.2rem
                        text-align: center
                        font-size: 0.35rem
                        font-weight: bold
                        color: #fff
                        
    </style>


<template>
<div class="login_div">
    <div class="login_top">
        <div class="logo">
            <img class="logo_img" src="/api/Img/AppLogo.png">
        </div>
    </div>
    <div class="login_bottom">
        <p class="welcome">歡迎!</p>
        <br>
        <p>請登入帳號及密碼</p>
        <q-input class="account" color="yellow" v-model="account" placeholder="帳號">
            <template v-slot:prepend>
                <q-icon name="account_circle" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
            </template>
        </q-input>
        <q-input class="password" color="yellow" v-model="password" placeholder="密碼" type="password">
            <template v-slot:prepend>
                <q-icon name="lock" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
            </template>
        </q-input>
        <div class="msg">{{msg}}</div>
        <div class="login_btn" @click="login">登入</div>
        <div class="forgot_password">忘記密碼</div>
        <router-link to="signup">
            <div class="sign_up" @click="sign_up">註冊</div>
        </router-link>
    </div>
</div>
</template>

<script>
import axios from 'axios'
export default {
    name:'LoginPage',
    data(){
        return{
            user_num:'',
            account:'',
            password:'',
            msg:'',
            state: false
        }
    },
    methods:{
        async login(){
            await axios.get('/api/member_login.php',{
            params: {
                account: this.account,
                password: this.password
            }
            })
            .then(res => {
                console.log(res.data)
                this.msg = res.data.err_msg
                this.user_num = res.data.user_num
                this.state = res.data.ok
            })
            if(!this.state){
                this.clear()
            }
            
            if(this.state){
                
                localStorage.setItem('token',this.user_num)
                this.$router.push('/')
            } else {
                this.$router.push('/login')
            }

        },
        clear(){
            this.account = ''
            this.password = ''
        },
        sign_up(){
            this.$router.push('/signup')
        }
        
    }
}
</script>

<style lang="sass" scoped>
    .login_div
        position: absolute
        height:0
        top:0
        left:0
        padding-bottom: 450px
        width: 100%
        background-color: #FFD40080
        .login_top
            
            display: flex
            justify-content: center
            .logo
                width: 5rem
                height: 4rem
                .logo_img
                    width: 5rem
                    height: 5rem
        .login_bottom
            position: relative
            height:0
            top:0
            left:0
            border-radius: 30px 30px 0 0
            background-color: #F5F5F5
            padding: 40px 30px 480px 20px
            margin-top: 20px
            overflow: hidden
            .welcome
                font-size: 0.5rem
                font-weight: bold
            .account
                margin-top: 0.5rem
            .password 
                margin-top: 0.5rem
            .login_btn
                margin: 0 auto
                margin-top: 1rem
                width: 5rem
                line-height: 1.1rem
                background-color: #FFBD09
                border-radius: 0.4rem
                text-align: center
                font-size: 0.35rem
                font-weight: bold
                color: #fff
            .forgot_password
                margin: 0 auto
                text-align: center
                margin-top: 0.5rem
            .sign_up
                margin: 0.5rem auto
                width: 5rem
                line-height: 1.1rem
                background-color: #FFBD09
                border-radius: 0.4rem
                text-align: center
                font-size: 0.35rem
                font-weight: bold
                color: #fff
            .msg
                font-weight: bold
                color: red
                text-align: center
                margin-top: 0.3rem
        
</style>
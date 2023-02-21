<template>
    <div class="personal_data" v-show="PersonalDataPage">
        <p class="title">輸入個人資料</p>
        <q-input class="name" color="yellow" v-model="name" placeholder="姓名">
            <template v-slot:prepend>
                <q-icon name="badge" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
            </template>
        </q-input>
        <q-input class="date" v-model="date"  type="date" />
        <q-input class="mail" color="yellow" v-model="mail" placeholder="電子信箱" type="email">
            <template v-slot:prepend>
                <q-icon name="mail" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
            </template>
        </q-input>
        <q-input class="phone" color="yellow" v-model="phone" placeholder="電話" type="tel">
            <template v-slot:prepend>
                <q-icon name="phone" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
            </template>
        </q-input>
        <q-input class="address" color="yellow" v-model="address" placeholder="地址" >
            <template v-slot:prepend>
                <q-icon name="home" style="color:#FFBD09;font-size:0.8rem;"></q-icon>
            </template>
        </q-input>
        {{msg}}
        {{state}}
        <router-link to="/login">
            <div class="confirm" @click="confirm">確認</div>
        </router-link>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    name:'PersonalData',
    data(){
        return{
            name: '',
            date: '',
            mail: '',
            phone:'',
            address: '',
            msg:'',
            state: ''
        }
    },
    props:{
        PersonalDataPage: Boolean,
        account: String
    },
    methods:{
        confirm(){
            if(this.name && this.date && this.mail && this.phone && this.address){
                console.log("傳送資料")
                console.log(this.account)
                axios.get('/api/member_enter_personal.php',{
                params: {
                    account: this.account,
                    name: this.name,
                    date: this.date,
                    mail: this.mail,
                    phone: this.phone,
                    address: this.address,
                }
                })
                .then(res => {
                    console.log(res.data)
                    this.state = res.data.ok
                })
            }else{
                this.msg = '請輸入完整資料'
            }
            
        }
    }
}
</script>

<style lang="sass" scoped>
    .personal_data
        position: relative
        height:0
        top:0
        left:0
        background-color: #fff
        padding: 40px 30px 820px 20px
        overflow: hidden
        .title
            font-size: 0.5rem
            font-weight: bold
        .name,.date,.mail,.address,.phone
            margin-top: 0.5rem
        .confirm
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
        .login
            margin-top: 0.2rem
            text-align: center
        .err_msg
            color: red
            margin-top: 0.2rem
            text-align: center
</style>
<template>
<div class="PersonalInfo_div" v-show="PersonalInfoPage">
    <div class="PersonalInfo">
        <div class="back" >
            <span class="material-icons back_arrow" @click="goback">
                navigate_before
            </span>
        </div>
        <div class="title">個人資料</div>
    </div>
    <div class="InfoList_div">
        <div class="edit" @click="edit">
            <div v-show="disabled">編輯</div>
            <div v-show="!disabled">完成</div>
        </div>
        <div class="InfoList">
            <div class="name">姓名</div>
            <q-input class="input" v-model="name" :disable="disabled"  filled/>
            <div class="birthday">出生日期</div>
            <q-input class="input" v-model="birthday"  :disable="disabled"  filled type="date"  />
            <div class="mail">電子信箱</div>
            <q-input class="input" v-model="mail" :disable="disabled" filled type="email"/>
            <div class="password">密碼</div>
            <q-input class="input" v-model="password" :disable="disabled" filled :type="isPwd ? 'password' : 'text'" />
            <div class="address">地址</div>
            <q-input class="input" v-model="address" :disable="disabled"  filled/>
            <div class="phone">手機號碼</div>
            <q-input class="input" v-model="phone" :disable="disabled"  filled type="tel" />
        </div>
        <div class="button" @click="send">送出</div>
    </div>
</div>
</template>

<script>
export default {
    name:'PersonalInformation',
    data(){
        return{
            name: '',
            birthday: '',
            mail: '',
            password: '',
            address: '',
            phone: '',
            disabled: true,
            isPwd: true
        }
    },
    props:{
        PersonalInfoPage: Boolean,
        personal_data: Object
    },
    watch:{
        personal_data(){
            this.name = this.personal_data.name
            this.password = this.personal_data.password
            this.birthday = this.personal_data.birthday
            this.mail = this.personal_data.email
            this.address = this.personal_data.address
            this.phone = this.personal_data.phone
        }
    },
    methods:{
        goback(){
            this.$emit("goback",'PersonalInfoPage') 
        },
        send(){
        },
        edit(){
            this.disabled = !this.disabled
            this.isPwd = !this.isPwd
        }
        
    }
}
</script>

<style lang="sass" scoped>
.PersonalInfo_div
    z-index: 101
    position: relative
    height:0
    top:0
    left:0
    padding-bottom: 900px
    width: 100%
    background-color: #FFD40080
    font-size: 25px
    .PersonalInfo
        position: relative
        padding-top: 25px
        display: flex
        flex-direction: row
        .title
            line-height: 30px
            position: relative
            top: 0          
            bottom: 0          
            left: 0       
            right: 0
            margin: auto
            font-weight: bold
        .back
            position: absolute
            left: 5px
            border-radius: 50%
            background-color: #fff
            height: 30px
            width: 30px
            .back_arrow
                position: absolute
                top: 50%
                left: 50%
                transform: translate(-50%,-50%)
                font-size: 0.5rem
                padding: 0
                font-size: 25px
    .InfoList_div
        position: ralative
        height:0
        top:0
        left:0
        border-radius: 30px 30px 0 0
        background-color: #F5F5F5
        padding-bottom: 840px
        margin-top: 20px
        .edit
            position: absolute
            font-size: 0.3rem
            right: 0
            margin: 0.4rem
            font-weight: bold
            color: blue
        .InfoList
            
            display: flex
            flex-direction: column
            padding: 0.8rem 0.8rem 0 0.8rem
            font-size: 0.3rem
            color: #6A6A6A
            .input
                margin: 0.4rem 0
                font-weight: bold
        .button
            position: relative
            top: 0           
            bottom: 0          
            left: 0      
            right: 0
            margin: auto
            width: 2.7rem
            line-height: 0.8rem
            border-radius: 0.3rem
            background-color: #FFBD09
            color: #fff
            font-weight: bold
            text-align: center
            font-size: 0.4rem
                
</style>

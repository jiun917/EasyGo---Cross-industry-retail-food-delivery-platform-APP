<template>
    <div class="search">
         <div class="header">
            <router-link to="/">
                <span class="material-icons">
                    arrow_back_ios
                </span>
            </router-link>
            <q-input filled square v-model="text"  placeholder="搜尋餐廳" :dense="true" class="input"/>
        </div>
        <div class="divider"></div>
    </div>
</template>

<script>
export default {
    name: 'SearchHeader'
}
</script>

<style lang="sass" scoped>
    .header
        height: 1.62rem
        width: 100%
        display: inline-flex
        align-items: center
        margin-left: 0.3rem
        .material-icons
            color: #FFD400
            font-size: 0.6rem
        .input 
            width: 6rem
            margin-left: 0.3rem
    .divider 
        height: 0.14rem
        background-color: #F2F2F2
</style>
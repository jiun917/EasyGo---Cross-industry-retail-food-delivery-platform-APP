<template>
    <div>
        <div class="title">搜尋紀錄</div>  
        <div class="history">
            <span class="material-icons search">
                search
            </span>
            <span>麥當勞</span>
            <span class="material-icons clear">
                clear
            </span>
        </div>
    </div>
</template>

<script>
export default {
    name:'SearchHistory'
}
</script>

<style lang="sass" scoped>
    .title 
        font-size: 0.3rem
        font-weight: bold
        margin: 0.2rem 0 0.5rem 0.2rem
    .history
        position: relative
        margin-left: 0.2rem
        .material-icons
            color: #FFD400
            font-size: 0.5rem
            &.search
                margin-right: 0.2rem
            &.clear 
                position: absolute
                right: 0
</style>
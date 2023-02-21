<template>
  <search-header></search-header>
  <search-history></search-history>
</template>

<script>
import SearchHeader from './components/Header.vue'
import SearchHistory from './components/History.vue'

export default {
    name: 'SearchPage',
    components:{
        SearchHeader,
        SearchHistory
    }
}
</script>

<style lang="sass" scoped>
    
            
</style>
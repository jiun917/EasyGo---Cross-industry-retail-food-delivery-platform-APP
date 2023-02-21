<template>
    <div>
        <map-tgos></map-tgos>
        <map-dock></map-dock>   
    </div>
</template>

<script>
import MapTgos from './components/Tgosmap.vue'
import MapDock from '../components/Dock.vue'
export default {
    name: 'MapPage',
    components: {
        MapTgos,
        MapDock
    },
  
}
</script>

<style>

</style>
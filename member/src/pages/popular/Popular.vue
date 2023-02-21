<template>
    <div class="popular">
        <div class="header">
            <router-link to="/">
                <span class="material-icons">
                    arrow_back_ios
                </span>
            </router-link>
            <div class="title">專屬你的推薦</div>
        </div>
        <q-scroll-area
        class="rounded-borders scroll"
        style="height: 15rem; width: 100%;"
        >
            <div class="q-pa-md  items-start q-gutter-md shop-item">
            <q-card class="my-card">
                <q-img src="https://cdn.quasar.dev/img/chicken-salad.jpg" />
                <q-card-section >
                <q-btn
                round
                color="yellow"
                icon="place"
                class="absolute"
                style="top: 0; right: 0.24rem; transform: translateY(-80%)"
                />
                <div class="row no-wrap items-center">
                    <div class="col  ellipsis text-bold">
                    肯德基
                    </div>
                    <span class="text-bold grade">5.0</span>
                    <span class="material-icons icon-start">
                        star
                    </span>
                </div>
                <div class="distance text-grey ellipsis /">
                    2分鐘, 950公尺
                </div>
                </q-card-section>
            </q-card>
            </div>
            <div class="q-pa-md  items-start q-gutter-md shop-item">
            <q-card class="my-card">
                <q-img src="https://cdn.quasar.dev/img/chicken-salad.jpg" />
                <q-card-section >
                <q-btn
                round
                color="yellow"
                icon="place"
                class="absolute"
                style="top: 0; right: 0.24rem; transform: translateY(-80%)"
                />
                <div class="row no-wrap items-center">
                    <div class="col  ellipsis text-bold">
                    肯德基
                    </div>
                    <span class="text-bold grade">5.0</span>
                    <span class="material-icons icon-start">
                        star
                    </span>
                </div>
                <div class="distance text-grey ellipsis /">
                    2分鐘, 950公尺
                </div>
                </q-card-section>
            </q-card>
            </div>
            <div class="q-pa-md  items-start q-gutter-md shop-item">
            <q-card class="my-card">
                <q-img src="https://cdn.quasar.dev/img/chicken-salad.jpg" />
                <q-card-section >
                <q-btn
                round
                color="yellow"
                icon="place"
                class="absolute"
                style="top: 0; right: 0.24rem; transform: translateY(-80%)"
                />
                <div class="row no-wrap items-center">
                    <div class="col  ellipsis text-bold">
                    肯德基
                    </div>
                    <span class="text-bold grade">5.0</span>
                    <span class="material-icons icon-start">
                        star
                    </span>
                </div>
                <div class="distance text-grey ellipsis /">
                    2分鐘, 950公尺
                </div>
                </q-card-section>
            </q-card>
            </div>
            <div class="q-pa-md  items-start q-gutter-md shop-item">
            <q-card class="my-card">
                <q-img src="https://cdn.quasar.dev/img/chicken-salad.jpg" />
                <q-card-section >
                <q-btn
                round
                color="yellow"
                icon="place"
                class="absolute"
                style="top: 0; right: 0.24rem; transform: translateY(-80%)"
                />
                <div class="row no-wrap items-center">
                    <div class="col  ellipsis text-bold">
                    肯德基
                    </div>
                    <span class="text-bold grade">5.0</span>
                    <span class="material-icons icon-start">
                        star
                    </span>
                </div>
                <div class="distance text-grey ellipsis /">
                    2分鐘, 950公尺
                </div>
                </q-card-section>
            </q-card>
            </div>
        </q-scroll-area>
    </div>
</template>

<script>
export default {
    name: 'PopularPage'
}
</script>

<style lang="sass" scoped>
    .header
        display: inline-flex
        align-items: center
        margin: 0.4rem 0 0 0.4rem 
        .title
            font-size: 0.4rem
            padding: 0 auto  
        .material-icons
            color: #FFD400
            font-size: 0.6rem
    .shop-item
        .my-card
            .q-img
                height: 3.5rem 
        .distance 
            margin-top: 0.1rem
        .material-icons
            color: #FFD400
            font-size: 0.35rem
    .scroll
        
        top: 0.2rem
        bottom: 1.28rem
        
    
</style>
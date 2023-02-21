import { createApp} from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { Quasar } from 'quasar'
import quasarUserOptions from './quasar-user-options'
import './styles/reset.css'
import './styles/quasar.sass'




createApp(App).use(Quasar, quasarUserOptions).use(router).use(store).mount('#app')
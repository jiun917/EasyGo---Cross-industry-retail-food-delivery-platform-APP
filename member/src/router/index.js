import { createRouter, createWebHistory } from 'vue-router'
import LoginPage from '@/pages/login/Login.vue'
import HomePage from '@/pages/home/Home.vue'
import SignupPage from '@/pages/signup/Signup.vue'
import FriendPage from '@/pages/friend/Friend.vue'
import MapPage from '@/pages/map/Map.vue'
import MemberPage from '@/pages/member/Member.vue'
import OrderHistoryPage from '@/pages/orderhistory/OrderHistory.vue'
import PointPage from '@/pages/Point/Point.vue'
import OrderPage from '@/pages/order/Order.vue'
import PopularPage from '@/pages/popular/Popular.vue'
import SearchPage from '@/pages/search/Search.vue'
import ShopPage from '@/pages/shop/Shop.vue'
import ShopcartPage from '@/pages/shopcart/Shopcart.vue'
import OrderInfoPage from  '@/pages/orderInfo/OrderInfo.vue'
import RatingOrder from  '@/pages/rating/Rating.vue'
import OrderDetail from  '@/pages/orderdetail/OrderDetail.vue'


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomePage
  },
  {
    path: '/login',
    name: 'login',
    component: LoginPage
  },
  {
    path: '/signup',
    name: 'signup',
    component: SignupPage
  },
  {
    path: '/friend',
    name: 'friend',
    component: FriendPage
  },
  {
    path: '/map',
    name: 'map',
    component: MapPage
  },
  {
    path: '/member',
    name: 'member',
    component: MemberPage
  },
  {
    path: '/OrderHistory',
    name: 'OrderHistory',
    component: OrderHistoryPage
  },
  {
    path: '/Point',
    name: 'Point',
    component: PointPage
  },
  {
    path: '/order',
    name: 'order',
    component: OrderPage
  },
  {
    path: '/popular',
    name: 'popular',
    component: PopularPage
  },
  {
    path: '/search',
    name: 'search',
    component: SearchPage
  },
  {
    path: '/shop',
    name: 'shop',
    component: ShopPage
  },
  {
    path: '/shopcart',
    name: 'shopcart',
    component: ShopcartPage
  },
  {
    path: '/orderInfo',
    name: 'orderInfo',
    component: OrderInfoPage
  },{
    path: '/rating',
    name: 'ratingorder',
    component: RatingOrder
  },{
    path: '/orderdetail',
    name: 'orderdetail',
    component: OrderDetail
  }
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  // }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
  //每次跳轉頁面回到最上層
  scrollBehavior(to,from,savedPosition) {
    if(savedPosition) {
      return savedPosition
    }else{
      return {top:0}
    }
  }
});




router.beforeEach((to, from, next) => {
  const isLogin = localStorage.getItem('token');
  if(from.name ==='login' && to.name === 'signup'){
    next()
  }else if(to.name !=='login' && !isLogin){
    next("/login")
  }else{
    next()
  }
  
})





export default router

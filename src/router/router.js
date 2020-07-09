import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router);
//const Movie = () => import('../components/movie/Movie');

const scrollBehavior = (to, from, savedPosition) => {
  const position = {};

  if (to.matched.some(m => m.meta.scrollToTop)) {
    position.x = 0;
    position.y = 0;
  }
  // if the returned position is falsy or an empty object,
  // will retain current scroll position.
  return position
};

const routes = [
  {
    path: '/',
    name: 'home',
    component: resolve => require(['@/components/index/Index.vue'], resolve),
  },
  {
    path: '/order',
    name: 'order',
    component: resolve => require(['@/components/Order.vue'], resolve),
  },
  {
    path: '/collect',
    name: 'collect',
    component: resolve => require(['@/components/Collect.vue'], resolve),
  },
  {
    path: '/my',
    name: 'my',
    component: resolve => require(['@/components/My.vue'], resolve),
  },
  {
    path: '/movie/:movieId',
    name: 'movie',
    component: function (resolve) {
      require(['../components/Movie'], resolve);
    },
    meta: { scrollToTop: true }
  },
  {
    path: '/cinema/:movieId',
    name: 'cinema',
    component: function (resolve) {
      require(['../components/Cinema'], resolve);
    },
    meta: { scrollToTop: true }
  },
  {
    path: '/city',
    name: 'city',
    component: function (resolve) {
      require(['../components/city/City'], resolve);
    },
    meta: { scrollToTop: true }
  },
  {
    path: '/shows/:cinemaId',
    name: 'shows',
    component: function (resolve) {
      require(['../components/show/Shows'], resolve);
    },
    meta: { scrollToTop: true }
  },
  {
    path: '/seats/:id/:time/:title/:cinema/:price',
    name: 'seats',
    component: function (resolve) {
      require(['../components/Seats'], resolve);
    },
    meta: { scrollToTop: true }
  },
  {
    path: '/login',
    name: 'login',
    component: function (resolve) {
      require(['../components/Login'], resolve);
    },
    meta: { scrollToTop: true }
  },
  {
    path: '/createOrder/:orderId',
    name: 'createOrder',
    component: function (resolve) {
      require(['../components/CreateOrder'], resolve);
    },
    meta: { hasEnter: true, scrollToTop: true }
  }
];

// const router = new Router({
//   mode: 'history',
//   scrollBehavior,
//   routes
// });

const router = new Router({
  routes,
  scrollBehavior
})


export default router;

import router from './router/router'

const auth = ['my', 'shows', 'seats', 'order', 'movie', 'cinema']
router.beforeEach((to, from, next) => {
  let id = localStorage.getItem('id')
  if (to.name == 'home') {
    next()
  } else if (to.name == 'login') {
    if (id == null || id == undefined) next()
    else next('/')
  } else if (auth.includes(to.name)) {
    if (id == null || id == undefined) next('/login')
    else next()
  } else {
    next()
  }

});

// VueCookies.set('isLogin', true, 60 * 60 * 1)

router.afterEach(() => {
})
<template>
  <div ref="seats" id="seats">
    <img :src="require('@/assets/back.jpg')" style="width: 100%;height: 3rem;object-fit: cover;">
    <div class="log">
      <img :src="require('@/assets/log.jpg')">
    </div>
    <div class="nick">{{nick}}</div>
    <div class="row" @click="toOrder">
      <div class="left">我的订单</div>
      <van-icon name="arrow" class="right" />
    </div>
    <div class="row" @click="$router.push('collect')">
      <div class="left">我的收藏</div>
      <van-icon name="arrow" class="right" />
    </div>
    <div class="row" @click="out">
      <div class="left">退出</div>
      <van-icon name="arrow" class="right" />
    </div>
  </div>
</template>

<script>
import { getSeat, submitOrder } from "@/api/api";
import { TitleManage } from "../utils/Manage";
export default {
  name: "seats",
  data() {
    return {
      show1: false,
      nick: localStorage.getItem("nick"),
      info: {}
    };
  },
  computed: {},
  watch: {},
  created() {
    TitleManage.setTitleInfo("my", "个人中心");
  },
  mounted() {},

  methods: {
    getData() {
      getSeat({
        id: this.timeId
      }).then(res => {
        if (res.code == 200) {
          this.seatsList = res.data;
        }
      });
    },
    out() {
      localStorage.clear();
      this.$router.push("/");
    },
    toOrder() {
      this.$router.push({ path: "/order" });
    }
  }
};
</script>

<style scoped lang="scss">
@import "../assets/css/seats.css";
.nick {
  font-size: 0.3rem;
  position: absolute;
  top: 23vh;
  z-index: 999;
  color: #fff;
  font-size: 0.4rem;
  width: 100%;
  text-align: center;
  left: 0;
}
.log {
  position: absolute;
  top: 12vh;
  z-index: 999;
  left: 0;
  width: 100%;
  text-align: center;
  img {
    width: 100%;
    height: 100%;
    width: 1.3rem;
    height: 1.3rem;
    object-fit: cover;
    border-radius: 50%;
  }
}
.row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.4rem 0.2rem;
  background-color: #fff;
  font-size: 0.3rem;
}
</style>

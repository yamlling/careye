<template>
  <div ref="seats" id="seats">
    <div class="rows" v-for="(item,index) in list" :key="index">
      <div class="row">
        <div class="left">{{item.cinemaName}}</div>
        <div class="right">影片: {{item.ticketName}}</div>
      </div>
      <div class="row">
        <div class="left">上映时间: <span style="color:green">{{item.time}}</span></div>
      </div>
      <div class="row">
        <div class="left">座位: {{item.seats}}</div>
      </div>
      <div class="row">
        <div class="right">下单时间: {{item.createTime}}</div>
        <div class="left" style="color:red">总价: {{item.sumPrice}}元</div>
      </div>
    </div>

  </div>
</template>

<script>
import { getOrder } from "@/api/api";
import { TitleManage } from "../utils/Manage";
export default {
  name: "order",
  data() {
    return {
      list: []
    };
  },
  computed: {},
  watch: {},
  created() {
    TitleManage.setTitleInfo("order", "我的订单");
    this.getData();
  },
  mounted() {},

  methods: {
    getData() {
      getOrder({
        id: localStorage.getItem('id')
      }).then(res => {
        if (res.code == 200) {
          this.list = res.data;
        }
      });
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
  padding: 0.2rem 0.2rem;
  background-color: #fff;
  font-size: 0.3rem;
}
.rows {
  margin-bottom: 20px;
}
</style>

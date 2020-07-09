<template>
  <!-- tr 需要绑定点击事件 -->
  <tr @click="booking()">
    <td class="stl-time">
      <div class="stl-time-wrap">
        <strong>{{sltInfo.tm}}</strong>
        <em>{{sltInfo.time}}开始</em>
      </div>
    </td>
    <td class="stl-info">
      <div class="stl-ver">{{sltInfo.language}}</div>
      <div class="two-line">{{sltInfo.room}}</div>
    </td>
    <td class="stl-price">
      <span class="unit theme-color">
        <span class="stonefont">{{sltInfo.price}}</span>元</span>
    </td>
    <td class="stl-buy">
      <a class="stl-btn">选座购票</a>
    </td>
  </tr>
</template>

<script>
import { TitleManage } from "../../utils/Manage";

export default {
  name: "show-time-item",
  props: {
    cinemaId: {
      required: true
    },
    movieId: {
      required: true
    },
    movieName: {
      required: true
    },
    // 排片情况
    sltInfo: {
      type: Object,
      required: true
    }
  },
  data() {
    return {};
  },
  methods: {
    booking: function() {
      // 允许订购
      // if (this.sltInfo.id) {
      //   // 获取标题信息
      //   // 页面跳转
      // }

      TitleManage.setTitleInfo("seats", document.title);
      this.$router.push({
        name: "seats",
        params: {
          id: this.sltInfo.id,
          time: this.sltInfo.time,
          title: this.movieName,
          cinema: document.title,
          price: this.sltInfo.price
        }
      });
    }
  }
};
</script>

<style scoped>
@import "../../assets/css/showTimeItem.css";
</style>

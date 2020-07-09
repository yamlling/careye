<template>
  <div ref="seats" id="seats">
    <div class="rows">
      <div class="row" v-for="(item,index) in list" :key="index" @click="$router.push(`/movie/${item.id}`)">
        <img style="height: 2.5rem;width: 2rem;object-fit: cover;" :src="item.img" alt="">
        <div class="right">
          <p style="color: black;font-size: 0.35rem;">{{item.name}}</p>
          <p>{{item.tag}}</p>
          <p>上映时间:{{item.date}}</p>
        </div>
        <van-button size="small" type="danger" @click.stop="del(item)" class="btn1">删除</van-button>
      </div>

    </div>

  </div>
</template>

<script>
import { getCollect, delCollect } from "@/api/api";
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
    TitleManage.setTitleInfo("collect", "我的收藏");
    this.getData();
  },
  mounted() {},

  methods: {
    getData() {
      getCollect({
        id: localStorage.getItem("id")
      }).then(res => {
        if (res.code == 200) {
          this.list = res.data;
        }
      });
    },
    del(item) {
      console.log(1);
      delCollect({
        id: localStorage.getItem("id"),
        collect: item.id
      }).then(res => {
        if (res.code == 200) {
          this.$toast("操作成功!");
        } else {
          this.$toast("操作失败!");
        }
        this.getData();
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
  position: relative;
  border-bottom: 0.2rem solid #f0efed;
}
.rows {
  margin-bottom: 20px;
}
.right {
  width: 100%;
  margin-left: 30px;
  align-self: flex-start;
  height: 100%;
}
/deep/ .van-button--small {
  height: 60px;
  width: 1rem;
  line-height: 60px;
  position: absolute;
  bottom: 0.5rem;
  right: 0.2rem;
}
/deep/ .van-button__text {
  font-size: 0.25rem;
  // padding: 0.25rem;
}
</style>

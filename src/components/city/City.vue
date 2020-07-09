<template>
  <div>
    <div class="cityInfo">
      <van-index-bar class="city" :sticky="false" highlight-color="#AE853A">
        <van-index-anchor v-for="(item,index) in city" :key="index" :index="item.initial">
          <span class="indexWord">{{item.initial}}</span>
          <van-cell @click="chooseCity(citem)" v-for="(citem,cindex) in item.list" :key="cindex" :title="citem.name" class="city-item" />
        </van-index-anchor>
      </van-index-bar>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import citys from "@/utils/city";
export default {
  name: "city",
  data() {
    return {
      city: citys.city
    };
  },
  components: {},
  computed: {},
  methods: {
    chooseCity(item) {
      this.$store.dispatch({
        type: "CHOOSE_CITY",
        cityCode: item.code,
        cityName: item.name
      });
      this.$router.go(-1);
    }
  },
  created() {}
};
</script>

<style scoped lang="scss">
.city {
  /deep/ .van-index-anchor {
    font-size: 0.3rem;
  }
  /deep/ .city-item {
    font-size: 0.3rem;
  }
  /deep/ .van-index-bar__sidebar {
    span {
      font-size: 0.2rem;
      padding: 0 4px 16px 16px;
    }
  }
  /deep/ .van-cell {
    padding: 16px 16px;
  }
}
</style>

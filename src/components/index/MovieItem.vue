<template>
  <li class="item">
    <a @click="toMoviePage">
      <div class="movie-cover">
        <img class="lazy" :src="movieInfo.img">
      </div>
      <div class="movie-content">
        <!-- 名称 -->
        <div class="flexRow flex-item flex-middle">
          <span class="movie-name .text-ellipsis">{{movieInfo.name}}</span>
          <!-- <span :class="{'movie-version': true, 'v2d': movieInfo.screen.v2d, 'v3d': movieInfo.screen.v3d, 'imax': movieInfo.screen.imax}"></span> -->
          <!-- 评分 -->
          <div class="movie-rating">
            <!-- 有评分 -->
            <span class="score">{{movieInfo.rate}}</span>
            <!-- 未上映 -->
            <!-- <span class="wish" v-else-if="!movieInfo.isShow">{{movieInfo.wish ? movieInfo.wish : 0}}</span>
            <span class="" v-else>暂无评分</span> -->

          </div>
        </div>
        <p>{{movieInfo.tag}}</p>
        <p>主演:{{movieInfo.actor}}</p>
        <p class="movie-show">上映时间:{{movieInfo.date}}</p>
      </div>
    </a>
    <div @click="$emit('change')" :class="{'movie-btn': true, 'movie-btn-presale':false}">
      {{'订购'}}
    </div>
  </li>
</template>

<script>
import { TitleManage } from "../../utils/Manage";

export default {
  name: "film-item",
  props: {
    movieInfo: {
      type: Object,
      default: function() {
        return {};
      }
    }
  },
  methods: {
    // 页面跳转
    toMoviePage: function() {
      // 设置标题信息
      // TitleManage.setTitleInfo("movie", this.movieInfo.name);
      // // 页面跳转
      var movieId = this.movieInfo.id;
      this.$router.push({ name: "movie", params: { movieId: movieId } });
    }
  },
  data() {
    return {};
  }
};
</script>

<style scoped>
@import "../../assets/css/movieItem.css";
</style>

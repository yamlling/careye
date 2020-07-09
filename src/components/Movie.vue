<template>
  <div>
    <div v-if="pageStatus === 'completed'">
      <div class="movie-page">
        <van-button size="small" type="warning" @click="collect" class="collect">收藏</van-button>
        <!-- 头 -->
        <section class="movie-header">
          <div class="movie">
            <div class="movie-background" :style="'background-image:url(' + bgimg +')'"></div>
            <div class="movie-filter"></div>
            <div class="movie-container clearfix">
              <div class="movie-cover movie-with-video">
                <a class="link">
                  <img class="img noneBg" :src="info.img">
                </a>
              </div>
              <div class="movie-content">
                <div class="movie-name text-ellipsis">
                  <span>{{info.name}}</span>
                </div>
                <div class="movie-score">
                  <div class="released-score">
                    <RatingBar :score="info.rate" />
                  </div>
                </div>
                <div class="movie-category">
                  <span class="movie-cat">{{info.tag}}</span>
                </div>
                <div class="movie-content-row">
                  <span>{{info.address}}</span>
                </div>
                <div class="movie-content-row">{{info.date}}上映</div>
              </div>
            </div>
          </div>
        </section>
        <!-- 简介 -->
        <section class="section-seperate section-expander">
          <a class="btn btn-block" @click="toCinemaPage">
            <span>立即购票</span>
          </a>
          <div ref="intro" class="text-expander" data-status="closed">
            <div ref="expander" class="text-expander-content">
              <p ref="context">{{info.content}}</p>
            </div>
            <div class="text-expander-button">
              <i class="icon icon-chevron-down" @click="expandCloseContent"></i>
            </div>
          </div>
        </section>
        <section class="section-seperate section-expander comm">
          <div style="margin-bottom: 30px;padding-bottom: 20px;border-bottom: 1px solid #cecece;color: #ffb100;">评论</div>
          <div class="row" v-for="(item,index) in info.comment" :key="index">
            <div class="row1">
              <div class="row-left">{{item.nick}}</div>
              <div class="row-right">{{item.time}}</div>
            </div>
            <div class="row2">
              {{item.content}}
            </div>
          </div>

          <div class="content">
            <van-field v-model="content" center clearable label="" placeholder="评论" type="textarea" rows="5" autosize>
              <template #button>
                <van-button size="small" type="primary" @click="submit">提交</van-button>
              </template>
            </van-field>
          </div>
        </section>
      </div>
    </div>
    <Loading v-if="pageStatus === 'loading'" />
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

import { TitleManage } from "../utils/Manage";
import LazyLoader from "../utils/LazyLoader";

import RatingBar from "./common/RatingBar";
import Loading from "./common/Loading";

import { getTicketInfo, submitComment, submitCollect } from "@/api/api";
export default {
  name: "movie-page",
  //mixins: [mixin],
  components: {
    RatingBar,
    Loading
  },
  data() {
    return {
      pageStatus: "loading",
      LazyLoader: null,
      content: "",
      info: {},
      // 影片id
      movieId: "",
      // 影片海报
      bgimg: "",
      posterUrl: "",
      // 影片名称
      movieName: "",
      movieEnm: "",
      // 评分
      score: 0,
      snum: 0,
      // 类型
      cat: "",
      // 上映地区
      src: "",
      // 时长
      dur: "",
      pubDesc: "",
      // 简介
      dra: "",

      egg: false,

      // 演职人员
      staff: []
    };
  },
  computed: {
    ...mapGetters(["movieInfo"])
  },
  created() {
    TitleManage.setTitleInfo("movie", "详情");
    this.movieId = this.$route.params.movieId;
    this.getData();
    // this.fetchData(this.movieId);
  },
  methods: {
    getData() {
      getTicketInfo({
        id: this.movieId
      }).then(res => {
        if (res.code == 200) {
          this.info = res.data;
        }
        this.pageStatus = "completed";
      });
    },

    submit() {
      submitComment({
        userId: localStorage.getItem("id"),
        ticketId: this.info.id,
        content: this.content
      }).then(res => {
        if (res.code == 200) {
          this.$toast("提交成功!");
          this.getData();
        } else {
          this.$toast("提交失败!");
        }
        this.content = "";
      });
    },

    //收藏
    collect() {
      submitCollect({
        id: localStorage.getItem("id"),
        ticketId: this.info.id
      }).then(res => {
        if (res.code == 200) {
          this.$toast("收藏成功!");
        } else {
          this.$toast(res.data);
        }
      });
    },
    ...mapActions({
      getMovieInfo: "GET_MOVIE_INFO"
    }),

    // 展开详细
    expandCloseContent: function() {
      var intro = this.$refs.intro;
      var status = intro.dataset.status;
      var expander = this.$refs.expander;

      if (status === "closed") {
        intro.dataset.status = "open";
        intro.classList.add("text-expander-expand-true");
        expander.style.maxHeight =
          this.$refs.context.clientHeight / window.devicePixelRatio + "rem";
      } else {
        intro.dataset.status = "closed";
        intro.classList.remove("text-expander-expand-true");
        expander.style.maxHeight = "";
      }
    },

    // 到影院列表
    toCinemaPage: function() {
      // 页面跳转
      this.$router.push("/");
    }
  },
  watch: {
    $route: function(newVal, oldVal) {
      if (newVal.name !== "movie") return;
      var movieId = newVal.params.movieId;
      if (movieId !== this.movieId) {
        this.pageStatus = "loading";
        this.LazyLoader = null;
        this.movieId = movieId;

        this.initLayout();
        this.fetchData(this.movieId);
      }
    }
  }
};
</script>

<style scoped lang="scss">
@import "../assets/css/movie.css";
.comm {
  font-size: 0.3rem;
  padding: 0.3rem 0.3rem 1rem !important;

  .row {
    margin-bottom: 40px;
    .row1 {
      display: flex;
      justify-content: space-between;
      color: #a5a5a5;
      margin-bottom: 20px;
    }
    .row2 {
      height: 90px;
      overflow: hidden;
    }
  }
}
.content {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  border-top: 1px solid #a5a5a5;
  /deep/ .van-field__control {
    font-size: 0.3rem;
  }
  /deep/ .van-button--small {
    height: 60px;
  }
  /deep/ .van-button__text {
    font-size: 0.25rem;
    padding: 0.25rem;
  }
}
.collect {
  font-size: 0.25rem;
  position: absolute;
  right: 20px;
  top: 1.2rem;
  z-index: 2;
  height: 40px;
}
</style>

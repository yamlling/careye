<template>
  <div ref="seats" id="seats">
    <div class="movie cf">
      <button ref="commit" class="btn btn-pay background-color" @click="commit">提交订单</button>
      <div class="info">
        <h3>{{title}}</h3>
        <p>{{time}}</p>
      </div>
    </div>
    <!-- 座位说明 -->
    <div class="tips cf" id="seatType" v-show="ticketCount === 0">
      <ul class="seat-intro" style="display:flex;justify-content: center;">
        <li><span class="seat active"></span>可选</li>
        <li><span class="seat selected"></span>已选</li>
        <li><span class="seat disabled"></span>已售</li>
      </ul>
    </div>
    <!-- 已选座位 -->
    <div class="tips cf" id="selectSeat" v-show="ticketCount > 0" style="display: none; transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
      <em class="theme-color">{{priceSum}}</em>
      <ul class="seat-list">
        <li v-for="(ticket, key) in ticketInfo">{{key}}</li>
      </ul>
    </div>
    <!-- 影厅信息 -->
    <div class="main">
      <!-- 影厅名称 -->
      <h3>{{hallName}}</h3>
      <div ref="wrapper" class="wrapper" style="">
        <div ref="scroll" class="scroll">
          <!-- 标记屏幕中央 -->
          <div class="c-tips">
            <span>银幕中央</span>
          </div>
          <!-- 虚线 -->
          <!-- <div class="center-line"></div> -->

          <!-- 座位图 -->
          <div ref="seatMap" class="seat-map">
            <!-- 循环行 -->
            <!-- <p v-for="(rowInfo, rowIndex) in seats" :key="rowIndex"> -->
            <!-- 循环列 -->
            <!-- <template v-for="colInfo in rowInfo.columns">
                <a v-if="colInfo.st === 'N'" :data-type="colInfo.st" :data-row="rowIndex+1" :data-column="colInfo.columnId" :data-num="colInfo.seatNo" class="seat active"></a>
                <a v-else-if="colInfo.st === 'LK'" :data-type="colInfo.st" :data-row="rowIndex+1" :data-column="colInfo.columnId" :data-num="colInfo.seatNo" class="seat disabled"></a>
              </template>
            </p> -->
            <span v-for="(item,index) in seatsList" :key="index">
              <a v-if="item.is === 0" data-type="N" :data-row="item.rows" :data-column="item.columns" :data-id="item.id" class="seat active"></a>
              <a v-else data-type="LK" :data-row="item.rows" :data-column="item.columns" :data-id="item.id" class="seat disabled"></a>
            </span>

          </div>
        </div>
      </div>
      <!-- 对应排数 -->
      <div class="side">
        <ol>
          <li class="cs"></li>
          <li v-for="index in 9" :key="index">{{index}}</li>
          <li class="cs"></li>
        </ol>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { getSeat, submitOrder } from "@/api/api";
import { TitleManage } from "../utils/Manage";
export default {
  name: "seats",
  data() {
    return {
      seatsList: [],
      title: "",
      time: "",
      timeId: "",
      cinema: "",
      price: 0,
      // 影院名称
      cinemaName: "",
      // 影院id
      cinemaId: "",
      // 放映厅
      hallId: "",
      hallName: "",
      // 影片
      movieName: "",
      // 影片id
      movieId: "",
      showId: "",
      // 一次最多购票数
      buyNumLimit: 90,
      // 播放时间
      dateShow: "",
      // 价格
      seatsPrice: {},
      price: "0",

      // 座位布局
      seats: [],
      // 座位（行）
      rows: 0,

      ticketInfo: {},
      ticketCount: 0
    };
  },
  computed: {
    ...mapGetters(["hallInfo"]),
    priceSum() {
      if (this.ticketCount === 0) {
        return 0;
      } else {
        return this.ticketCount * this.price;
      }
    }
  },
  watch: {
    // 第一次不执行
    $route: function(to, from) {
      if (to.name === "seats") {
        this.initView();
      }
    }
  },
  created() {
    this.title = this.$route.params.title;
    this.time = this.$route.params.time;
    this.price = this.$route.params.price;
    this.cinema = this.$route.params.cinema;
    this.timeId = this.$route.params.id;
    // this.fetchData();
    this.getData();
  },
  mounted() {
    this.selectSeat();
  },

  methods: {
    getData() {
      getSeat({
        id: this.timeId
      }).then(res => {
        if (res.code == 200) {
          this.seatsList = res.data;
        }
      });
      this.$nextTick(function() {
        // 滚动到屏幕中央
        this.initView();
      });
    },

    // 初始化布局
    initView: function() {
      // 获取dom节点
      var wrapper = this.$refs.wrapper;
      var scroll = this.$refs.scroll;

      var wrapperWidth = wrapper.clientWidth;
      //  获取seat-map的宽度，既座位图的实际宽度
      var seatMapWidth = scroll.querySelector(".seat-map").clientWidth;

      // 设置滑块宽度
      scroll.style.width = seatMapWidth + "px";
      // 获取滑块实际宽短
      var scrollWidth = scroll.clientWidth;

      // 判断是否发生滚动，若发生将'银幕中央滚动到屏幕中心'
      if (scrollWidth > wrapperWidth) {
        wrapper.scrollTo((scrollWidth - wrapperWidth) / 2, 0);
      }
    },

    // 选座
    selectSeat: function() {
      var seatMap = this.$refs.seatMap;
      // 添加点击事件
      seatMap.addEventListener("click", e => {
        var target = e.target;
        if (target.tagName === "A" && target.dataset.type === "N") {
          if (target.classList.contains("active")) {
            if (this.ticketCount >= this.buyNumLimit) {
              this.openTip({
                message: "一次最多选择" + this.buyNumLimit + "个座位"
              });
              return;
            }
            // 切花样式
            target.classList.remove("active");
            target.classList.add("selected");
            // 添加座位
            var key = target.dataset.row + "排" + target.dataset.column + "座";
            //var value = target.dataset.row + '排' + target.dataset.column + '座';
            this.ticketInfo[key] = target.dataset.id;
            this.ticketCount++;
          } else {
            // 切花样式
            target.classList.remove("selected");
            target.classList.add("active");
            // 删除座位
            var key = target.dataset.row + "排" + target.dataset.column + "座";
            delete this.ticketInfo[key];
            this.ticketCount--;
          }

          // this.price =
          //   this.ticketCount === 0
          //     ? 0
          //     : this.seatsPrice[this.ticketCount]["price"];
        }
      });
    },

    // 检查座位位置
    isValidSeat: function(seat) {
      // 获取前一个节点
      var preNode = seat.previousSibling;
      // 当选中节点的前一个节点为空位时
      if (preNode && preNode.classList.contains("active")) {
        // 获取前前一个节点
        preNode = preNode.previousSibling;
        // 当前前节点不存在、前前节点不为空位
        if (!preNode || !preNode.classList.contains("active")) return false;
      }

      // 获取下一个节点
      var nextNode = seat.nextSibling;
      // 当选中节点的下一个节点为空位时
      if (nextNode && nextNode.classList.contains("active")) {
        // 获取下下一个节点
        nextNode = nextNode.nextSibling;
        // 当下下节点不存在、下下节点不为空位
        if (!nextNode || !nextNode.classList.contains("active")) return false;
      }

      return true;
    },

    // 提交数据
    commit: function() {
      var ticketInfo = this.ticketInfo;
      // 遍历所以选中的节点
      for (var key in ticketInfo) {
        if (!this.isValidSeat(ticketInfo[key])) {
          this.openTip({
            message: "请重新选择座位，旁边不要留下单个座位"
          });
          return;
        }
      }
      // 若ticketInfo不为空
      if (key) {
        let params = {
          userId: localStorage.getItem("id"),
          cinemaName: this.cinema,
          sumPrice: this.priceSum,
          ticketName: this.title,
          time: this.time,
          seats: Object.keys(ticketInfo).join(","),
          seatId: ticketInfo
        };
        submitOrder(params).then(res => {
          if (res.code == 200) {
            this.$toast("提交成功");
            this.$router.push('/order')
          } else {
            this.$toast("提交失败");
          }
        });
      }
    }
  }
};
</script>

<style scoped>
@import "../assets/css/seats.css";
</style>

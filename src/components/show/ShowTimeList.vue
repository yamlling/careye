<template>
  <table>
    <ShowTimeItem v-for="(sltInfo, index) in plist" :sltInfo="sltInfo" :cinemaId="cinemaId" :movieId="movieId" :key="index" :movieName="movieName" />
  </table>
</template>

<script>
import ShowTimeItem from "./ShowTimeItem";

export default {
  name: "show-time-list",
  components: {
    ShowTimeItem
  },
  props: {
    cinemaId: {
      required: true
    },
    movieName: {
      required: true
    },
    movieId: {
      required: true
    },
    plist: {
      type: Array,
      required: true
      // default: function () {
      //   return { }
      // }
    }
  },
  data() {
    return {};
  }
};
</script>

<style scoped>
@import "../../assets/css/showTimeList.css";
</style>

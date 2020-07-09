<template>
  <div>
    <div ref="topTip" id="topTip"></div>

    <div class="login-way" v-show="normalLoginWay">
      <div class="normal-login-way">
        <div>
          <div class="account">
            <input class="input-weak" type="text" placeholder="账户名" name="user" v-model="login.user" required>
          </div>
        </div>
        <div>
          <div class="password">
            <input class="input-weak" type="password" placeholder="请输入您的密码" name="pwd" v-model="login.pwd" required>
          </div>
        </div>
      </div>

    </div>

    <div class="login-way" v-show="!normalLoginWay">
      <div class="normal-login-way">
        <div>
          <div class="account">
            <input class="input-weak" type="text" placeholder="账户名" v-model="regis.user" required>
          </div>
        </div>
        <div>
          <div class="password">
            <input class="input-weak" type="password" placeholder="请输入您的密码" v-model="regis.pwd" required>
          </div>
        </div>
        <div>
          <div class="password">
            <input class="input-weak" type="text" placeholder="请输入昵称" v-model="regis.nick" required>
          </div>
        </div>
      </div>
    </div>
    <div class="btn-wrapper">
      <div style="color: red;font-size: 0.3rem;text-align: right;margin-bottom:20px;color:#929292" v-if="normalLoginWay" @click="normalLoginWay=false">没有账号?点击注册</div>
      <div style="color: red;font-size: 0.3rem;text-align: right;margin-bottom:20px;color:#929292" v-if="!normalLoginWay" @click="normalLoginWay=true">返回</div>
      <button ref="login" type="submit" class="btn btn-larger btn-block disabled login-btn" @click="doLogin" v-if="normalLoginWay">登录</button>
      <button ref="login" type="submit" class="btn btn-larger btn-block disabled login-btn" @click="doRegister" style="margin-top:30px;" v-if="!normalLoginWay">注册</button>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import { login, register } from "@/api/api";
export default {
  name: "login",
  data() {
    return {
      aaa: "",
      normalLoginWay: true,
      regis: {
        pwd: "",
        user: "",
        nick: ""
      },
      login: {
        pwd: "",
        user: ""
      }
    };
  },
  components: {},
  methods: {
    // 登陆
    doLogin() {
      login(this.login).then(res => {
        if (res.code == 200) {
          this.$toast("登录成功");
          localStorage.setItem("id", res.data[0].id);
          localStorage.setItem("user", res.data[0].user);
          localStorage.setItem("nick", res.data[0].nick);
          this.$router.push({
            path: "/"
          });
        } else {
          this.$toast("登录失败");
        }
      });
    },

    //注册
    doRegister() {
      for (const key in this.regis) {
        if (this.regis[key] === "") {
          this.$toast("请填写所有信息!");
          return;
        }
      }
      register(this.regis).then(res => {
        if (res.code == 200) {
          this.$toast("注册成功");
          this.normalLoginWay = true;
        } else {
          this.$toast("注册失败");
        }
      });
    }
  },
  mounted() {}
};
</script>

<style scoped>
@import "../assets/css/login.css";
</style>

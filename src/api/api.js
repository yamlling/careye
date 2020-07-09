import request from '@/utils/request'

const URL_PORT = '/api/'



//获取影票-列表
export function getTicketList(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/all",
        data: params
    })
}

//获取影票-单条
export function getTicketOne(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/ticketone",
        data: params
    })
}


//获取影城-列表
export function getCinemaList(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/cinema/all",
        data: params
    })
}

//获取影城-单条
export function getCinemaOne(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/cinemaone",
        data: params
    })
}

//影城-获取所有影片
export function getCinemaTickets(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/cinematickets",
        data: params
    })
}

//影片-获取开场时间点
export function getTicketTime(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/time",
        data: params
    })
}

//影片-获取座位
export function getSeat(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/seat",
        data: params
    })
}

//提交订单
export function submitOrder(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/submit",
        data: params
    })
}

//注册
export function register(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/register",
        data: params
    })
}

//登录
export function login(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/login",
        data: params
    })
}

//获取用户订单
export function getOrder(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/order",
        data: params
    })
}

//获取影片信息以及评论
export function getTicketInfo(params) {
    return request({
        method: "post",
        url: URL_PORT + "ticket/getticket",
        data: params
    })
}

//提交评论
export function submitComment(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/comment",
        data: params
    })
}

//获取收藏
export function getCollect(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/getCollect",
        data: params
    })
}

//提交收藏
export function submitCollect(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/collect",
        data: params
    })
}

//提交收藏
export function delCollect(params) {
    return request({
        method: "post",
        url: URL_PORT + "user/delCollect",
        data: params
    })
}
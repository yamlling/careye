const express = require('express');
const router = express.Router();
var mysql = require('mysql');
var config = require('../utils/mysql');
var connection = mysql.createConnection(config);
connection.connect();
const sd = require('silly-datetime');
const time = sd.format(new Date(), 'YYYY-MM-DD HH:mm');

// 添加座位
router.get('/addseat', (req, res) => {
    let timeId = [10, 11, 12, 13, 14, 15, 16, 17, 18]
    let sqlClient = new Promise((resolve, reject) => {
        for (let index = 1; index < 91; index++) {
            let str = ((index / 10) % 100).toString();
            let rows = str.split('.')[1] == undefined ? Number(str.split('.')[0]) : Number(str.split('.')[0]) + 1
            let columns = str.split('.')[1] == undefined ? 10 : str.split('.')[1]
            for (const key in timeId) {
                let sql = `insert into c_seat (rows,columns,timeId) values('${rows}','${columns}',${timeId[key]})`;
                connection.query(sql, function (err, result) {
                    if (err) {
                        reject(err.message)
                    }
                    resolve()
                })
            }
        }
    })
    sqlClient.then(res => {
        res.json({ code: 200, data: '成功' });
    })
});

// 登录接口
router.post('/login', (req, res) => {
    let sql = `SELECT * from c_user where user = '${req.body.user}' AND pwd = '${req.body.pwd}' limit 1`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        if (result.length === 0) {
            res.json({ code: 300 });
        }
        res.json({ code: 200, data: result });
    });
});

// 注册接口
router.post('/register', (req, res) => {
    let userObj = req.body;
    let sql = `INSERT INTO c_user(user, pwd, nick) VALUES('${userObj.user}', '${userObj.pwd}', '${userObj.nick}')`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        if (result.length === 0) {
            res.json({ code: 300 });
        }

        res.json({ code: 200, data: result });
    });
});

// 获取用户订单
router.post('/order', (req, res) => {
    let sql = `SELECT * from c_order where userId=${req.body.id}`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

//提交评论
router.post('/comment', (req, res) => {
    let sql = `INSERT INTO c_comment(userId, ticketId, time, content) VALUES('${req.body.userId}', '${req.body.ticketId}', '${time}', '${req.body.content}')`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

// 删除收藏
router.post('/delCollect', (req, res) => {
    let sql = `SELECT * from c_user where id=${req.body.id}`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        let collect = result[0].collect.split(',')
        let collectNew = []
        collect.map((item, index) => {
            if (item != req.body.collect) {
                collectNew.push(item)
            }
        })
        sql = `update c_user SET collect='${collectNew}' where id=${req.body.id}`
        connection.query(sql, function (er, resu) {
            if (er) {
                res.json({ code: 300, data: er.message });
            }
        })
        res.json({ code: 200, data: '成功' });
    });
});

//获取收藏
router.post('/getCollect', (req, res) => {
    let sql = `select * from c_user where id=${req.body.id}`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        if (result[0].collect == null || result[0].collect == '') {
            res.json({ code: 200, data: [] });
        } else {
            // let tickets = result[0].collect.split(',')
            sql = `select * from c_ticket where id IN (${result[0].collect})`
            connection.query(sql, function (er, resu) {
                if (er) {
                    res.json({ code: 300, data: er.message });
                }
                res.json({ code: 200, data: resu });
            })
        }

    });
});


//收藏
router.post('/collect', (req, res) => {
    let sql = `select * from c_user where id=${req.body.id}`
    connection.query(sql, function (errs, results) {
        if (errs) {
            res.json({ code: 300, data: errs.message });
        }
        let collect = ''
        // console.log(results[0].collect);return
        if (results[0].collect != null && results[0].collect != '') {

            if (results[0].collect.split(',').includes(req.body.ticketId.toString())) {
                res.json({ code: 300, data: '已经收藏过该影片!' }); return
            }
            collect = results[0].collect + ',' + req.body.ticketId
        } else {
            collect = req.body.ticketId
        }
        sql = `update c_user SET collect='${collect}' where id=${req.body.id}`
        connection.query(sql, function (err, result) {
            if (err) {
                res.json({ code: 300, data: err.message });
            }
        })
        res.json({ code: 200, data: '成功' });
    });
});

/**
 * @dateTime:2018/04/28 09:55:12
 * @author:ChenJun
 * @desc:个人中心更新数据接口，包括上传图片
 */
const formidable = require('formidable');
const moment = require('moment');
const path = require('path');
const fs = require('fs');
router.post('/updateInfo', (req, res, next) => {

    let userObj = req.body;
    let sql = `update s_user SET name = '${userObj.name}', sex = '${userObj.sex}', email = '${userObj.email}', tel = '${userObj.tel}' where id = ${userObj.id} `;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });

    const form = new formidable.IncomingForm();
    form.uploadDir = "./static/uploads";// 设置文件上传存放地址
    form.parse(req, function (err, fields, files) {
        // fields为其它的数据，files为文件
        let headPic;
        if (files && JSON.stringify(files) !== "{}") {
            // 需要上传图片
            const t = moment(new Date()).format('YYYY_MM_DD');
            const timestamp = Date.now();
            // 扩展名
            const extname = path.extname(files.file.name);
            // 旧的路径
            const oldpath = path.join(__dirname, '../../', files.file.path);
            // 文件名
            headPic = t + '_' + timestamp + extname;
            // 新的路径
            const newpath = path.join(__dirname, '../../static/uploads/', headPic);
            // 注意两个路径要一致
            console.log(oldpath, newpath);
            // 更改名字和路径
            fs.rename(oldpath, newpath, (err) => {
                if (err) {
                    return res.json({
                        "code": 401,
                        "desc": "图片上传失败"
                    })
                }
            });
        }

        User.findOne({ name: fields.name }, (err, user) => {
            if (err) console.log(err);
            if (user) {
                let _user = Object.assign(user, fields, headPic ? { img: headPic, firstSave: false } : '');
                _user.save((err) => {
                    if (err) console.log(err);
                    res.json({ code: 200, desc: '保存成功' });
                })
            } else {
                res.json({ code: 403, desc: '没有此用户' });
            }
        });
    })
})
module.exports = router;

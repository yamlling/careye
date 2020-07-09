const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const config = require('../utils/mysql');
const sd = require('silly-datetime');
const time = sd.format(new Date(), 'YYYY-MM-DD HH:mm');



const connection = mysql.createConnection(config);
connection.connect();


// 影票-列表
router.post('/all', (req, res) => {
    let sql = `SELECT * from c_ticket`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

// 影票-单条
router.post('/ticketone', (req, res) => {
    let sql = `SELECT * from c_ticket where id=${req.body.id}`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

// 影城-列表
router.post('/cinema/all', (req, res) => {
    let sql = `SELECT * from c_cinema where city='${req.body.city}'`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

// 影城-单条
router.post('/cinemaone', (req, res) => {
    let sql = `SELECT * from c_cinema where id=${req.body.id}`;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

// 影城-获取某影城所有影片
router.post('/cinematickets', (req, res) => {
    let sql = "SELECT `tic`.`name`,`tic`.`rate`,`tic`.`img`, `tic`. `id` FROM `c_ticket_join` `join` INNER JOIN `c_ticket` `tic` ON `tic`.`id`=`join`.`ticketId` WHERE  `join`.`cinemaId` = " + req.body.id
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

//获取影片开场时间
router.post('/time', (req, res) => {
    let sql = `select * from c_ticket_time where ticketId=${req.body.id}`
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

//获取座位
router.post('/seat', async (req, res) => {
    let sql = `select * from c_seat where timeId=${req.body.id} `;
    connection.query(sql, function (err, result) {
        if (err) {
            res.json({ code: 300, data: err.message });
        }
        res.json({ code: 200, data: result });
    });
});

//提交订单
router.post('/submit', async (req, res) => {
    let sql = `INSERT INTO c_order (userId,cinemaName,sumPrice,ticketName,time,createTime,seats) VALUES ('${req.body.userId}','${req.body.cinemaName}','${req.body.sumPrice}','${req.body.ticketName}','${req.body.time}','${time}','${req.body.seats}')`

    //修改座位状态
    let quer = new Promise((resolve, reject) => {
        for (let key in req.body.seatId) {
            let sql1 = "update c_seat SET `is`=1 where id=" + req.body.seatId[key]
            console.log(sql1)
            connection.query(sql1, function (err, result) {
                if (err) {
                    reject(err.message)
                }
                resolve()
            });
        }
    })

    quer.then(rrr => {
        connection.query(sql, function (err, result) {
            if (err) {
                res.json({ code: 300, data: err.message });
            }
            res.json({ code: 200, data: result });
        });
    })
});

//获取影片信息以及评论
router.post('/getticket', async (req, res) => {
    let sql = `select * from c_ticket where id=${req.body.id}`;
    connection.query(sql, function (errs, results) {
        if (errs) {
            res.json({ code: 300, data: errs.message });
        }
        let sql = `SELECT * FROM c_comment inner join c_user where c_comment.userId=c_user.id AND c_comment.ticketId=${req.body.id}`
        connection.query(sql, function (err, result) {
            if (err) {
                res.json({ code: 300, data: err.message });
            }
            results[0]['comment'] = result
            res.json({ code: 200, data: results[0] });
        })
    });
});
module.exports = router;

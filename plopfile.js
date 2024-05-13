/**
 * @file plop执行入口文件
 */

const fn = require('./scripts/add');

module.exports = function (plop) {
    plop.setGenerator('fn', fn);
};

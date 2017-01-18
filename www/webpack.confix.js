var webpack = require('webpack'); 
var path = require('path');                 //引入node的path库

var config = {
  entry: ['./app/index.js'],                //入口文件
  output: {
    path: path.resolve(__dirname, 'dist'),  // 指定编译后的代码位置为 dist/bundle.js
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      // 为webpack指定loaders
      //{ test: /\.js$/, loaders: ['babel'], exclude: /node_modules/ }   
    ]
  }
}

module.exports = config;
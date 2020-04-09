const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const path = require("path");

module.exports = {
  entry: { main: "./src/javascript/main.js" },
  output: {
    path: path.resolve(__dirname, "public"),
    filename: "[name]_bundle.js",
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader"],
        options : {
            publicPath : './public'
        }
      },
    ],
  },
  plugins : [
    new HtmlWebpackPlugin({
        template : './src/page/index.html',
        filename : './index.html'
    }),new MiniCssExtractPlugin()
  ]
};

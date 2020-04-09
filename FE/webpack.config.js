const HtmlWebpackPlugin = require('html-webpack-plugin');
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
        use: ["style-loader", "css-loader"],
      },
    ],
  },
  plugins : [
    new HtmlWebpackPlugin({
        template : './src/page/index.html',
        filename : './index.html'
    })
  ]
};

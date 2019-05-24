const webpack = require('webpack');
const path = require('path');

const config = {
  devtool: 'eval',
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
    
    // Modify the name of the generated source map file.
    // You can use [file], [id], and [hash] replacements here.
    // The default option is enough for most use cases.
    sourceMapFilename: '[file].map', // Default

    // This is the source map filename template. It's default
    // format depends on the devtool option used. You don't
    // need to modify this often.
    devtoolModuleFilenameTemplate:
      'webpack:///[resource-path]?[loaders]',
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        use: 'babel-loader',
        exclude: /node_modules/
      }
    ]
  },
  resolve: {
    extensions: [
      '.js',
      '.jsx'
    ]
  },
  devServer: {
    host: '0.0.0.0',//your ip address
    port: 8080,
    contentBase: './dist',
    headers: {'Access-Control-Allow-Origin': '*'},
    historyApiFallback: {
      index: 'http://localhost:8080/index.html'
    },
    allowedHosts: [
        '.shawwn.com'
    ],
  }
}

module.exports = config;

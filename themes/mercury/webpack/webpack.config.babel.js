const path = require('path');
const webpack = require('webpack');
const autoprefixer = require('autoprefixer');
const { getIfUtils, removeEmpty } = require('webpack-config-utils');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const stats = {
    colors: true,
    hash: false,
    version: false,
    timings: false,
    assets: false,
    chunks: false,
    modules: false,
    reasons: false,
    children: false,
    source: false,
    errors: false,
    errorDetails: false,
    warnings: false,
    publicPath: false,
};

module.exports = (env, argv) => {

    const { ifProduction } = getIfUtils(argv.mode);

    return {
        mode: ifProduction('production', 'development'),
        entry: path.resolve(__dirname, '../source/scripts/app.js'),
        stats,
        devtool: ifProduction('', 'source-map'),
        output: {
            publicPath: '/themes/mercury/dist/scripts/',
            path: path.resolve(__dirname, '../dist/scripts'),
            filename: '[name].js',
            // sourceMapFilename: '[name].map[query]'
        },
        resolve: {
            alias: {
                'images': path.resolve(__dirname, '../dist/images/standard')
            }
        },
        module: {
            rules: [
                {
                    test: /\.js$/,
                    exclude: /node_modules/,
                    loader: 'babel-loader'
                },
                {
                    test: /\.scss$/,
                    use: [
                        MiniCssExtractPlugin.loader,
                        {
                            loader: 'css-loader',
                            options: { sourceMap: ifProduction(true, false) }
                        },
                        {
                            loader: 'postcss-loader',
                            options: {
                                sourceMap: ifProduction(true, false),
                                plugins: [
                                    autoprefixer({
                                        'overrideBrowserslist': ['last 10 versions']
                                    })
                                ]
                            }
                        },
                        {
                            loader: 'sass-loader',
                            options: { sourceMap: ifProduction(true, false) }
                        },
                        {
                            loader: 'import-glob-loader',
                            options: { sourceMap: ifProduction(true, false) }
                        },
                    ]
                },
                {
                    test: /\.(jpg|png|gif|svg)$/,
                    loader: 'image-webpack-loader',
                    enforce: 'pre'
                },
                {
                    test: /\.(png|jpg|gif|eot|ttf|woff|woff2)$/,
                    loader: 'file-loader',
                    options: {
                        name: '[name][hash].[ext]',
                        outputPath: '../images/generated/'
                    }
                },
            ]
        },
        optimization: {
            minimizer: [
                new UglifyJsPlugin({
                    cache: true,
                    parallel: true,
                    extractComments: 'all',
                    sourceMap: ifProduction(true, false)
                }),
                new TerserPlugin({
                    sourceMap: true,
                    terserOptions: {
                        compress: {
                            drop_console: true,
                        },
                    },
                }),
                new OptimizeCssAssetsPlugin({
                    cssProcessorOptions: { discardComments: { removeAll: true } },
                    canPrint: true
                })
            ]
        },
        plugins: removeEmpty([
            new FriendlyErrorsWebpackPlugin(),
            new webpack.PrefetchPlugin(path.resolve(__dirname, '../source/styles/style.scss')),
            new MiniCssExtractPlugin({ filename: '../styles/[name].css', chunkFilename: '[id].css' })
        ])
    };
};
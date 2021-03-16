const path = require('path');
const WebappWebpackPlugin = require('webapp-webpack-plugin');
const root = path.resolve(__dirname, '../');

const config = {
    entry: root + '/icon.png',
    output: {
        path: root + '/themes/SELECTED_THEME/dist/images',
    }, module: {
        rules: [
            {
                test: /\.png$/,
                exclude: /node_modules/,
                use: {
                    loader: 'url-loader',
                }
            }
        ]
    },
    plugins: [
        new WebappWebpackPlugin({
            logo: root + '/icon.png',
            prefix: 'favicons/',
            favicons: {
            }
        })
    ]
};

module.exports = config;
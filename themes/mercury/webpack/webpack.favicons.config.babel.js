const path = require('path');
const root = path.resolve(__dirname, '../../../');

const config = {
    entry: root + '/icon.png',
    output: {
        path: root + '/themes/mercury/dist/images',
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
    }
};

module.exports = config;
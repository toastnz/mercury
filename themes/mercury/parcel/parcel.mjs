import { Parcel } from '@parcel/core';
import { fileURLToPath } from 'url';

let bundler = new Parcel({
    entries: [
        'themes/mercury/source/scripts/app.js',
        'themes/mercury/source/styles/style.scss'
    ],
    defaultConfig: '@parcel/config-default',
    mode: 'production',
    defaultTargetOptions: {
        engines: {
            browsers: ['last 1 Chrome version']
        }
    },
    additionalReporters: [
        {
            packageName: '@parcel/reporter-cli',
            resolveFrom: fileURLToPath(import.meta.url)
        }
    ]
});



try {
    let { bundleGraph, buildTime } = await bundler.run();
    let bundles = bundleGraph.getBundles();
    console.log(`✨ Built ${bundles.length} bundles in ${buildTime}ms!`);
} catch (err) {
    console.log(err.diagnostics);
}

let subscription = await bundler.watch((err, event) => {
    if (err) {
        throw err;
    }

    if (event.type === 'buildSuccess') {
        let bundles = event.bundleGraph.getBundles();
        console.log(`✨ Built ${bundles.length} bundles in ${event.buildTime}ms`);
    } else if (event.type === 'buildFailure') {
        console.log(event.diagnostics);
    }
}); 
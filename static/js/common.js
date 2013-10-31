require.config({
    // All subsequent Urls are relative to baseUrl
    baseUrl: '/static/global/js',

    // Set paths here for any script not located in baseUrl
    // so that we can reference modules directly in all
    // subsequent require and define calls.
    paths: {
        // libs
        'jquery': 'lib/require-jquery',
        'bootstrap': 'lib/bootstrap',
        'underscore': 'lib/underscore',
        'jquery.flexslider': 'lib/jquery.flexslider',
        'ekko-lightbox': 'lib/ekko-lightbox',

        // apps - one page applications, each requires a separate build file
        'sitewide': 'apps/sitewide',
        'homepage': 'apps/homepage',
        'shows': 'apps/shows',
        'show': 'apps/show',
        'media': 'apps/media',
    },

    // The shim is needed for any libs that are not AMD modules
    // or are jquery plugins.
    shim: {
        // non-AMD libs
        'underscore': { exports: '_' },
        // jQuery plugins
        'bootstrap': { deps: ['jquery'] },
        'jquery.flexslider': { deps: ['jquery'] },
        'ekko-lightbox': { deps: ['jquery'] }
    }
});

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
        'jquery.scrollTo': 'lib/jquery.scrollTo',
        'jquery.easing': 'lib/jquery.easing',
        'ekko-lightbox': 'lib/ekko-lightbox',
        'select2': 'lib/select2.min',
        'highcharts': 'lib/highcharts',

        // apps - one page applications, each requires a separate build file
        'sitewide': 'apps/sitewide',
        'homepage': 'apps/homepage',
        'shows': 'apps/shows',
        'show': 'apps/show',
        'past': 'apps/past',
        'media': 'apps/media',
        'videopage': 'apps/videopage',
        'fidouche': 'apps/fidouche',
    },

    // The shim is needed for any libs that are not AMD modules
    // or are jquery plugins.
    shim: {
        // non-AMD libs
        'underscore': { exports: '_' },
        // jQuery plugins
        'bootstrap': { deps: ['jquery'] },
        'jquery.flexslider': { deps: ['jquery'] },
        'jquery.scrollTo': { deps: ['jquery'] },
        'jquery.easing': { deps: ['jquery'] },
        'ekko-lightbox': { deps: ['jquery'] },
        'highcharts': { exports: 'highcharts', deps: ['jquery'] }
    }
});

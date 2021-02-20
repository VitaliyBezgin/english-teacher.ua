const mix = require('laravel-mix');

mix.js('resources/js/app.js', 'public/js').postCss('resources/css/app.css', 'public/css', [
    require('postcss-import'),
    require('tailwindcss'),
    require('autoprefixer'),
]);
mix.js('resources/js/practice-check.js', 'public/js');
mix.js('resources/js/Battle.js', 'public/js');
mix.js('resources/js/friendsList.js', 'public/js');
mix.js('resources/js/wordsLesson.js', 'public/js').sass('resources/sass/main.scss', 'public/css');

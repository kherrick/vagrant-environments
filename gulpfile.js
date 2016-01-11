const gulp = require('gulp');
const babel = require('gulp-babel');
const nodemon = require('gulp-nodemon');
const watch = require('gulp-watch');
const sourcemaps = require('gulp-sourcemaps');

gulp.task(
  'default',
  [ 'watch' ]
);

gulp.task(
  'watch',
  [
    'watch-client',
    'watch-server',
    'nodemon',
  ]
);

gulp.task(
  'build',
  [
    'build-client',
    'build-server',
  ]
);

gulp.task('build-client', () =>
  gulp.src('src/public/**/*.js')
    .pipe(sourcemaps.init())
    .pipe(babel())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('app/public'))
);

gulp.task('build-server', () =>
  gulp.src('src/server/**/*.js')
    .pipe(sourcemaps.init())
    .pipe(babel())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('app/server'))
);

gulp.task('watch-client', () => {
  watch('src/public/**/*.js', () => {
    gulp.start('build-client');
  });
});

gulp.task('watch-server', () => {
  watch('src/server/**/*.js', () => {
    gulp.start('build-server');
  });
});

gulp.task('nodemon', () =>
  nodemon({
    script: 'app/server/server.js',
    ext: 'js html',
    env: { 'NODE_ENV': 'development' },
  })
);

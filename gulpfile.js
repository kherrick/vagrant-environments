const gulp = require('gulp');
const babel = require('gulp-babel');
const shell = require('gulp-shell');
const watch = require('gulp-watch');
const sourcemaps = require('gulp-sourcemaps');

gulp.task(
  'default',
  [ 'watch' ]
);

gulp.task('build', () => {
  return gulp.src('app/client/**/*.js')
    .pipe(sourcemaps.init())
    .pipe(babel())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('app/public'));
});

gulp.task('watch', () => {
  watch('app/client/**/*.js', () => {
    gulp.start('build');
  });
});

gulp.task('develop',
  shell.task('bin/nodemon app/server/server.js')
);

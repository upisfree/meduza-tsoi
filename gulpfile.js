var gulp = require('gulp'),
    browserify = require('browserify'),
    source = require('vinyl-source-stream'),
    buffer = require('vinyl-buffer'),
    uglify = require('gulp-uglify'),
    coffee = require('gulp-coffee'),
    gutil = require('gulp-util');

gulp.task('client-dev', function()
{
  return browserify(
  {
    entries: ['./src/client/index.coffee'],
    extensions: ['.coffee']
  })
  .transform('coffeeify')
  .bundle()
  .pipe(source('client.dev.js'))
  .pipe(buffer())
  .pipe(gulp.dest('./bin'));
});

gulp.task('client-min', function() // release
{
  return browserify(
  {
    entries: ['./src/client/index.coffee'],
    extensions: ['.coffee']
  })
  .transform('coffeeify')
  .bundle()
  .pipe(source('client.min.js'))
  .pipe(buffer())
  .pipe(uglify())
  .pipe(gulp.dest('./bin'));
});

gulp.task('server', function()
{
  gulp.src('./src/server/**/*.coffee')
      .pipe(coffee({bare: true}).on('error', gutil.log))
      .pipe(gulp.dest('./bin/server'));
});

gulp.task('dev', function() {
  gulp.watch('./src/client/**', ['client-dev']);
  gulp.watch('./src/server/**', ['server']);
});

gulp.task('default', ['dev']);
gulp.task('release', ['client-min']);
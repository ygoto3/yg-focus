gulp = require 'gulp'
clean = require 'gulp-clean'
browserify = require 'gulp-browserify'
rename = require 'gulp-rename'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'

gulp.task 'clean', ->
  gulp.src './dist/**/*'
  .pipe clean(force: true)

gulp.task 'coffee', [
  'clean'
], ->
  gulp.src './src/index.coffee', {read: false}
  .pipe browserify(
    transform: ['coffeeify']
    extensions: ['.coffee']
  )
  .pipe rename('index.js')
  .pipe gulp.dest('./dist')

gulp.task 'samples_clean', ->
  gulp.src './samples/**/*'
  .pipe clean(force: true)

gulp.task 'samples', [
  'samples_clean'
], ->
  gulp.src './samples_src/**/*.jade'
  .pipe jade({})
  .pipe gulp.dest('./samples/')

  gulp.src './samples_src/stylus/style.styl'
  .pipe stylus()
  .pipe gulp.dest('./samples/css')

  gulp.src './samples_src/coffee/index.coffee', {read: false}
  .pipe browserify(
    transform: ['coffeeify']
    extensions: ['.coffee']
  )
  .pipe rename('index.js')
  .pipe gulp.dest('./samples/js')

gulp.task 'default', ->
  gulp.run 'coffee'

fs = require 'fs'

try
  arn = require( './.aws.json' ).lambda.arn
catch e
  console.log e

module.exports = ( grunt ) ->

  grunt.initConfig
    pkg : grunt.file.readJSON "package.json"

    lambda_package :
      default :
        options :
          package_folder : "build"

    lambda_deploy :
      default :
        arn : arn

    copy :
      build :
        src : [ 'package.json', 'speech/**/*.{txt,ssml}' ]
        dest : 'build/'

    clean :
      default : [ "dist", "build", "*.{js,map}", "lib/**/*.{map,js}" ]

    coffee :
      options :
        sourceMap : false
        bare : true
        force : true

      build :
        expand : true
        src : [ "lib/**/*.coffee", "*.coffee", "!Gruntfile.coffee" ]
        dest : "build"
        ext : '.js'

    watch :
      build :
        tasks : [ "coffee:build" ]
        files : [ "lib/**/*coffee", "*.coffee" ]

  for t in [ "contrib-watch", "contrib-coffee", "contrib-clean", "aws-lambda", "contrib-copy" ]
    grunt.loadNpmTasks "grunt-#{t}"

  grunt.registerTask "default", [ "clean", "coffee", "copy" ]
  grunt.registerTask "pkg", [ "lambda_package" ]
  grunt.registerTask "deploy", [ "pkg", "lambda_deploy" ]


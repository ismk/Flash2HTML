require_relative 'boilerplate'
require_relative 'initial_files'
require_relative 'pdf2img'
require_relative 'insert_tags'

require "f2h/version"
require 'rmagick'

module F2h
  class Flash2HTML

    #  Initializing the instance variables
    def initialize
      @get_current_dir        = Dir.getwd
      @get_current_foldername = File.basename(@get_current_dir)
      @init                   = InitialFiles.new
      @bp                     = Boilerplate.new
      @pdf2img                = Img2Pdf.new
      @it                     = InsertTags.new
    end

    def main
      opts = ARGV
      case opts[0]
      when "new"
        @init.make_files
      when "g", "generate"
        case opts[1]
        when "img"
          case opts[2]
          when "box"
            puts "Couldnt Find the box html,css,js files" unless File.exists? (@get_current_foldername+"_box.html")
            puts "Generating IMG tags for box in HTML, relative code for CSS and JS"
            files_to_be_written = opts[3..-1]
            @it.insert_img_html(files_to_be_written,"box")
            @it.insert_img_css(files_to_be_written,"box")
            @it.insert_img_js(files_to_be_written,"box")
          when "banner"
            puts "Couldnt Find the banner html,css,js files" unless File.exists? (@get_current_foldername+"_banner.html")
            puts "Generating IMG tags for banner in HTML, relative code for CSS and JS"
            files_to_be_written = opts[3..-1]
            @it.insert_img_html(files_to_be_written,"banner")
            @it.insert_img_css(files_to_be_written,"banner")
            @it.insert_img_js(files_to_be_written,"banner")
          when "both"
            puts "Generating tags for both box and banner"
            files_to_be_written = opts[3..-1]
            ["box","banner"].each do |type|
              @it.insert_img_html(files_to_be_written,type)
              @it.insert_img_css(files_to_be_written,type)
              @it.insert_img_js(files_to_be_written,type)
            end
          else
            puts "either pass 'box','banner' or 'both' as flags after generate"
          end
        when "pdf"
          puts "This is the pdf"
          pdf_files = opts[2..-1]
          @pdf2img.do_the_pdf(pdf_files)
        else
          puts "either pass img or pdf"
        end
      when "-help"
        puts help
      else
        puts "Please use a proper flag\nUse -help flag to see all the options"
      end
    end

    def help
      <<-eos
      Flags are:
          -new
            : Which Generates html,css and js files for Box and Banners
            : Also downloads the current verison of jQuery and TweenMax

          -g or genrate
            : The Generate Flag is to be used in conjunction with either
              -img
                :Generates tags in html, css and js

              -pdf
                :Extracts imgages from the source PDF passed in as args
                 Creates a Folder and html file with all the images as tags
      eos
    end

  end
end

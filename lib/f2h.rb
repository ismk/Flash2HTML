require_relative 'boilerplate'
require_relative 'initial_files'
require_relative 'pdf2img'
require_relative 'insert_tags'

require "f2h/version"
require 'rmagick'
require 'pry'

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
      when "wallboard"
        @init.make_wallboard_files
      when "g", "generate"
        case opts[1]
        when "img"
          case opts[2]
          when "box"
            puts "Couldnt Find the box html, css, js files" unless File.exists? (@get_current_foldername+"_box.html")
            puts "Generating IMG tags for box in HTML, relative code for CSS and JS"
            files_to_be_written = opts[3..-1]
            @it.insert_img_html(files_to_be_written,"box")
            @it.insert_img_css(files_to_be_written,"box")
            @it.insert_img_js(files_to_be_written,"box")
          when "banner"
            puts "Couldnt Find the banner html, css, js files" unless File.exists? (@get_current_foldername+"_banner.html")
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
            puts "either pass 'box', 'banner' or 'both' as flags after 'generate img'"
          end
        when "pdf"
          puts "This is the pdf"
          pdf_files = opts[2..-1]
          @pdf2img.do_the_pdf(pdf_files)
        else
          puts "either pass img or pdf"
        end
      when "d", "delete"
        case opts[1]
        when "img"
          case opts[2]
          when "box"
            puts "Couldnt Find the box html, css, js files" unless File.exists? (@get_current_foldername+"_box.html")
            puts "Deleting IMG tags for box in HTML, relative code for CSS and JS"
            files_to_be_deleted = opts[3..-1]
            @it.delete_img_html(files_to_be_deleted, "box")
            @it.delete_img_css(files_to_be_deleted, "box")
            @it.delete_img_js(files_to_be_deleted, "box")
          when "banner"
            puts "Couldnt Find the banner html, css, js files" unless File.exists? (@get_current_foldername+"_banner.html")
            puts "Deleting IMG tags for banner in HTML, relative code for CSS and JS"
            files_to_be_deleted = opts[3..-1]
            @it.delete_img_html(files_to_be_deleted, "banner")
            @it.delete_img_css(files_to_be_deleted, "banner")
            @it.delete_img_js(files_to_be_deleted, "banner")
          when "both"
            puts "Deleting tags for both box and banner"
            files_to_be_deleted = opts[3..-1]
            ["box","banner"].each do |type|
              @it.delete_img_html(files_to_be_deleted, type)
              @it.delete_img_css(files_to_be_deleted, type)
              @it.delete_img_js(files_to_be_deleted, type)
            end
          else
            puts "either pass 'box', 'banner' or 'both' as flags after 'delete img'"
          end
        else
          puts "Please pass img"
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
      : Which Generates html, css and js files for Box and Banners
      : Also downloads the current verison of jQuery and TweenMax

      -wallboard
      : Generates html, css, and js files for Wallboard
      : Also downloads the current version of jQuery and TweenMax

      -g or genrate
      : The Generate Flag is to be used in conjunction with either
      -img
      : Generates tags in html, css and js
      : In conjunction with either
      - box
      - banner
      : Specifies which asset to generate the image(s) for
      OR
      -pdf
      : Extracts imgages from the source PDF passed in as args
      : Creates a Folder and html file with all the images as tags

      -d or delete
      : The Delete Flag is to be used in conjunction with either
      -img
      : Deletes tags in html, css and js
      : In conjunction with either
      - box
      - banner
      : Specifies which asset to delete the image(s) for
      eos
    end

  end
end

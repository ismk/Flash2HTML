require_relative 'boilerplate'
require "f2h/version"
require 'rmagick'

module F2h
  class Flash2HTML

    def initialize
      @bp = Boilerplate.new
    end

    def make_files
      make_dirs
      @types.each do |t|
        @ext.each do |k,value|
          if value
            File.open("#{k}/"+@get_current_foldername+"_#{t}.#{k}", 'w+') do |file|
              file.write(send("@bp.#{t}_#{k}_boilerplate"))
            end
          else
            File.open(@get_current_foldername+"_#{t}.#{k}", 'w+') do |file|
              to_write = @bp.html_boilerplate(@get_current_foldername, t)
              file.write(to_write)
            end
          end
        end
      end
      exec('curl -o js/TweenMax.min.js http://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenMax.min.js;curl -o js/jquery.min.js https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js')
    end

    def make_dirs
      Dir.mkdir("js") unless Dir.exist?("js")
      Dir.mkdir("css") unless Dir.exist?("css")
      Dir.mkdir("box_images") unless Dir.exist?("box_images")
      Dir.mkdir("banner_images") unless Dir.exist?("banner_images")
    end

    def insert_img_html(filenames,location)
      text_to_be_inserted = ""
      filenames.each do |f|
        text_to_be_inserted << @bp.img_html(f,location)
      end
      read = File.read(@get_current_foldername+"_#{location}.html")
      first_part, second_part, third_part = read.split(/(<!-- End-of-the-Image-Tags -->)/)
      first_part << text_to_be_inserted
      everything = first_part + second_part + third_part
      File.open(@get_current_foldername+"_#{location}.html", "w+") do |f|
        f.write(everything)
      end
    end

    def insert_img_css(filenames,location)
      text_to_be_inserted = ""
      filenames.each do |f|
        text_to_be_inserted << @bp.img_css(f)
      end
      read = File.read("css/"+@get_current_foldername+"_#{location}.css")
      first_part, second_part, third_part = read.split(/(\/\* Start-of-the-ISI \*\/)/)
      first_part << text_to_be_inserted
      everything = first_part + second_part + third_part
      File.open("css/" + @get_current_foldername+"_#{location}.css", "w+") do |f|
        f.write(everything)
      end
    end

    def insert_img_js(filenames,location)
      text_to_be_inserted = ""
      filenames.each do |f|
        text_to_be_inserted << @bp.img_js(f)
      end
      read = File.read("js/"+@get_current_foldername+"_#{location}.js")
      first_part, second_part, third_part = read.split(/(\/\/End-of-the-animation-code)/)
      first_part << text_to_be_inserted
      everything = first_part + second_part + third_part
      File.open("js/" + @get_current_foldername+"_#{location}.js", "w+") do |f|
        f.write(everything)
      end
    end

    def do_the_pdf(pdfs_to_html)
      p pdfs_to_html
      html_pdf_imgs = []
      pdfs_to_html.each do |file|
        if file.include? " "
          File.rename(file, file.gsub(" ","_"))
          file = file.gsub(" ","_")
        end
        pdf_folder_name = File.basename(file, ".*")
        Dir.mkdir(pdf_folder_name)
        p file
        imgs_from_pdf = Magick::Image.read(file) { self.density = 300 }
        imgs_from_pdf.each_with_index do |img,idx|
          img_tag = ['<img src="', '" alt="">']
          img_tag.insert(1,"#{pdf_folder_name}/#{pdf_folder_name}_#{idx}.png")
          html_pdf_imgs <<  img_tag.join
          img.write(pdf_folder_name+"/#{pdf_folder_name}_#{idx}.png") { self.quality = 100}
        end
        temp = @bp.pdf_html
        temp = temp.split(/(<body>)/)
        temp.insert(2,html_pdf_imgs.join("\n"))
        temp = temp.join
        puts temp
        File.open(pdf_folder_name+".html", "w+") do |f|
          f.write(temp)
        end
      end
    end

    def main

      @get_current_dir = Dir.getwd
      @get_current_foldername = File.basename(@get_current_dir)
      @box_name = ""
      @banner_name = ""

      @types = ["box", "banner"]
      @ext = { "html" => false,"css" => true,"js" => true }

      opts = ARGV
      case opts[0]
      when "new"
        make_files
      when "g", "generate"
        case opts[1]
        when "img"
          case opts[2]
          when "box"
            puts "Couldnt Find the box html,css,js files" unless File.exists? (@get_current_foldername+"_box.html")
            puts "Generating IMG tags for box in HTML, relative code for CSS and JS"
            files_to_be_written = opts[3..-1]
            insert_img_html(files_to_be_written,"box")
            insert_img_css(files_to_be_written,"box")
            insert_img_js(files_to_be_written,"box")
          when "banner"
            puts "Couldnt Find the banner html,css,js files" unless File.exists? (@get_current_foldername+"_banner.html")
            puts "Generating IMG tags for banner in HTML, relative code for CSS and JS"
            files_to_be_written = opts[3..-1]
            insert_img_html(files_to_be_written,"banner")
            insert_img_css(files_to_be_written,"banner")
            insert_img_js(files_to_be_written,"banner")
          when "both"
            puts "Generating tags for both box and banner"
            files_to_be_written = opts[3..-1]
            ["box","banner"].each do |type|
              insert_img_html(files_to_be_written,type)
              insert_img_css(files_to_be_written,type)
              insert_img_js(files_to_be_written,type)
            end
          else
            puts "either pass 'box','banner' or 'both' as flags after generate"
          end
        when "pdf"
          puts "this is the pdf"
          pdf_files = opts[2..-1]
          do_the_pdf(pdf_files)
        else
          puts "either pass img or pdf"
        end
      when "-help"
        puts "Flags are:\nnew\ng or generate"
      else
        puts "Please use a proper flag\nUse -help flag to see all the options"
      end
    end
  end
end

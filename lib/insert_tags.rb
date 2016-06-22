module F2h
  class InsertTags

    def initialize
      @get_current_dir = Dir.getwd
      @get_current_foldername = File.basename(@get_current_dir)
      @bp = Boilerplate.new
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

    def delete_img_html(filenames, location)
      text_to_be_deleted = ""
      filenames.each do |f|
        text_to_be_deleted << @bp.img_html(f, location)
      end
      read = File.read(@get_current_foldername+"_#{location}.html")
      first_part, second_part, third_part = read.split(/(<!-- End-of-the-Image-Tags -->)/)
      first_part.slice!(text_to_be_deleted)
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

    def delete_img_css(filenames, location)
      text_to_be_deleted = ""
      filenames.each do |f|
        text_to_be_deleted << @bp.img_css(f)
      end
      read = File.read("css/"+@get_current_foldername+"_#{location}.css")
      first_part, second_part, third_part = read.split(/(\/\* Start-of-the-ISI \*\/)/)
      first_part.slice!(text_to_be_deleted)
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

    def delete_img_js(filenames, location)
      text_to_be_deleted = ""
      filenames.each do |f|
        text_to_be_deleted << @bp.img_js(f)
      end
      read = File.read("js/"+@get_current_foldername+"_#{location}.js")
      first_part, second_part, third_part = read.split(/(\/\/End-of-the-animation-code)/)
      first_part.slice!(text_to_be_deleted)
      everything = first_part + second_part + third_part
      File.open("js/" + @get_current_foldername+"_#{location}.js", "w+") do |f|
        f.write(everything)
      end
    end
  end
end

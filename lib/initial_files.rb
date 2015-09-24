module F2h
  class InitialFiles
    def initialize
      @get_current_dir = Dir.getwd
      @get_current_foldername = File.basename(@get_current_dir)
      @box_name = ""
      @banner_name = ""
      @types = ["box", "banner"]
      @ext = { "html" => false,"css" => true,"js" => true }
      @bp = Boilerplate.new
    end

    def make_files
      make_dirs
      @types.each do |t|
        @ext.each do |k,value|
          if value
            File.open("#{k}/"+@get_current_foldername+"_#{t}.#{k}", 'w+') do |file|
              k.eql?("js") ? t.eql?("box") ? to_write = @bp.box_js_boilerplate : to_write = @bp.banner_js_boilerplate : t.eql?("box") ? to_write = @bp.box_css_boilerplate : to_write = @bp.banner_css_boilerplate
                # file.write(send("#{@bp}.#{t}_#{k}_boilerplate"))
              file.write(to_write)
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
  end
end

module F2h
  class Img2Pdf
    def initialize
      @bp = Boilerplate.new
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
  end
end

module F2h
  class Img2Pdf
    def initialize
      @bp = Boilerplate.new
    end

    def do_the_pdf(pdfs_to_html)
      p pdfs_to_html
      pdfs_to_html.each do |file|
      html_pdf_imgs = []
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
        pdf_blob = @bp.pdf_html
        pdf_blob = pdf_blob.split(/(<body>)/)
        pdf_blob.insert(2,html_pdf_imgs.join("\n"))
        pdf_blob = pdf_blob.join
        puts pdf_blob
        File.open(pdf_folder_name+".html", "w+") do |f|
          f.write(pdf_blob)
        end
        pdf_blob = ""
      end
    end
  end
end

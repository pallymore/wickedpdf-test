class StaticController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test_pdf",
          template: "static/index.html.erb"
      end
    end
  end

  def download
    file = Tempfile.new ['test', '.pdf']
    file.write(render_to_string(
       pdf: "test_pdf",
       template: "static/index.html.erb"
     ).force_encoding('utf-8'))
    send_file file
  ensure
    file.close
  end

end

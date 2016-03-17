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

end

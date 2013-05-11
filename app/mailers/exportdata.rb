class Exportdata < ActionMailer::Base
  default from: "jonathanlai@gmail.com"

  def form_email(to)
    @bookmark = Bookmark.find(params[:id])
    mail(:to => to, :subject => "My Quote8on for me!")
  end

end



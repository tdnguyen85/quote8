class Exportdata < ActionMailer::Base
  default from: "jonathanlai@gmail.com"

  def form_email(to, id)
    @bookmark = Bookmark.find(id)
    mail(:to => to, :subject => "My Quote8ion for me!")
  end

end



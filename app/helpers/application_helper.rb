module ApplicationHelper
  def avatar_url (user)
    if user.image.nil?
      user.image = "user.jpeg"
    else
      user.image = user.image
    end
  end
end

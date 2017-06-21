class User < ApplicationRecord
  has_secure_password

  def image_url_or_default
    image_url.present? ? image_url : 'https://marketplace.canva.com/MAB6v7RGMOw/1/thumbnail/canva-robot-electric-avatar-icon-MAB6v7RGMOw.png'
  end
end

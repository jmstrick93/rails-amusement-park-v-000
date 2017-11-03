class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, :through => :rides

  validates :name, presence: true

  def mood
    if happiness > nausea
      "happy"
    else
      "sad"
    end
  end

  def authenticate_user(user)
  end

end

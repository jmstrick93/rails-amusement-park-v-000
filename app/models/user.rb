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

  def go_on_attraction(attraction)
    self.happiness += attraction.happiness_rating
    self.nausea += attraction.nausea_rating
    self.tickets -= attraction.tickets
    self.save
  end


end

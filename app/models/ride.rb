class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction


  def take_ride
    #create array of response messages for rider
    messages = [has_enough_tickets, is_tall_enough].compact
    if !messages.empty?
      #if messages array is not empty, add "Sorry." to beginning and join into one string.
      messages.unshift("Sorry.").compact.join(" ")
    else
      #update ticket count, nausea, and happiness & save
      self.user.go_on_attraction(self.attraction)
    end
  end


  def is_tall_enough
    if user.height < attraction.min_height
      "You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def has_enough_tickets
    if self.user_tickets < self.attraction_tickets
      "You do not have enough tickets to ride the #{self.attraction.name}."
    end
  end

  def has_no_nil
    self&.user_tickets && self&.attraction_tickets && self&.user_height && self&.attraction_min_height
  end


  def user_tickets
    self.user.tickets
  end

  def user_height
    self.user.height
  end

  def attraction_tickets
    self.attraction.tickets
  end

  def attraction_min_height
    self.attraction.min_height
  end

end

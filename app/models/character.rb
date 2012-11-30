class Character < ActiveRecord::Base

  before_create :create_permalink

  belongs_to :user

  def to_param
  	permalink
  end

  private
    def create_permalink
      self.permalink = "#{self.first_name.downcase}-#{self.last_name.downcase}"
    end
end

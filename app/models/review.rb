class Review < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :review_text, presence: true

  def rate!(value)
    return if value.blank?
    self.increment(:rating_value, value.to_i)
    self.increment(:rating_count)
    save 
  end

end

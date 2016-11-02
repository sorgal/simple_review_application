class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :review

  validates :comment_text, presence: true

  def creation(review_rating_value)
    self.class.transaction do
      save && Review.find_by(id: review_id).rate!(review_rating_value)
    end
  end

  def rate!(value)
    return if value.blank?
    self.increment(:rating_value, value.to_i)
    self.increment(:rating_count)
    save 
   end

end

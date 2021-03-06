class Book < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id:user.id).exists?
  end

validates :title,presence: true
validates :body,length: { maximum: 200 },presence: true

end

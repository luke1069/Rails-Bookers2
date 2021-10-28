class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "User"
  # Userモデルの「与フォロー」のuser_idに従属
  belongs_to :followed, class_name: "User"
  # Userモデルの「与フォロー」のuser_idに従属

end

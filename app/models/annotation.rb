class Annotation < ApplicationRecord
  scope :search_title_or_annotation, -> (title) { where("lower(title)  like ? OR lower(annotation) like ?", "%#{title}%".downcase, "%#{title}".downcase)}

  has_one :user
  enum priority:  [:baixa, :media, :alta]
  validates :title, :annotation, presence: true
end

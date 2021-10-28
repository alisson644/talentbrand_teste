class Annotation < ApplicationRecord
  scope :search_title_or_annotation, -> (title) { where("title  like ? OR annotation like ?", "%#{title}%", "%#{title}")}

  has_one :user
  enum priority:  [:baixa, :media, :alta]
end

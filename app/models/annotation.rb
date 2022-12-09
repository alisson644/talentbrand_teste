class Annotation < ApplicationRecord
  scope :search_title_or_annotation, -> (title) { where("unaccent(title)  ILIKE unaccent(?) OR unaccent(annotation) ILIKE unaccent(?)", "%#{title}%", "%#{title}")}

  has_one :user
  enum priority:  [:baixa, :media, :alta]
  validates :title, :annotation, presence: true
end

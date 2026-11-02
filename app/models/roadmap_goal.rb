class RoadmapGoal < ApplicationRecord
  STATUSES = %w[planned in_progress completed].freeze
  validates :title, presence: true, length: { maximum: 120 }
  validates :category, presence: true
  validates :status, inclusion: { in: STATUSES }
end

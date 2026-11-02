class PlannerItem < ApplicationRecord
  CATEGORIES = [
    "Study & Learning",
    "Portfolio & Projects",
    "Job Search & Career",
    "Home & Family",
    "Personal & Self-care",
    "Other"
  ].freeze

  attribute :completed, :boolean, default: false

  validates :title, presence: true, length: { maximum: 120 }
  validates :category, inclusion: { in: CATEGORIES }
  validates :scheduled_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_time_must_be_after_start_time

  private

  def end_time_must_be_after_start_time
    return if start_time.blank? || end_time.blank?

    start_minutes = start_time.hour * 60 + start_time.min
    end_minutes = end_time.hour * 60 + end_time.min

    if end_minutes <= start_minutes
      errors.add(:end_time, "must be after the start time")
    end
  end
end

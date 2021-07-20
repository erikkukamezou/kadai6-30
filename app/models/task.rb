class Task < ApplicationRecord
  validates :name, presence: true
  validates :detail , presence: true

  belongs_to :user
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels, source: :label

  enum status: { 未着手:0, 着手中:1, 完了:2 }
  enum priority: { 高:0, 中:1, 低:2 }

  # scope :search, -> { where("search like? OR status like?") }
  # task "/search" => "task#search"
  scope :search_by_name, ->(params) do where('name LIKE ?', "%#{params}%")
  end
  scope :search_by_status, ->(params) do where(status: params)
  end

  # def save_label(sent_labels)
  #   current_labels = self.labels.pluck(:label_name) unless self.labels.nil?
  # end
end

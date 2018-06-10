class List < ActiveRecord::Base
  
  validates :name, presence: true
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  
  has_many :tasks , dependent: :destroy

  belongs_to :user

  def done_tasks
     tasks.where(done: true).order("updated_at DESC")
  end
  
end


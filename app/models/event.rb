class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :invitees, through: :invitations, class_name: "User", source: :invitee
  has_many :attendees, class_name: "User"
  default_scope { order(:created_at => :desc)}
  scope :upcoming, -> {where("start > ?", DateTime.now)}
  scope :past, -> {where("start < ?", DateTime.now)}


  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true
  validate :picture_size

  private

  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less than 5MB")
  	end
  end
end

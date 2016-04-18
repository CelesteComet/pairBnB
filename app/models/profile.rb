class Profile < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :location, :profile_pic

	validates_uniqueness_of :user_id
	mount_uploader :profile_pic, ImageUploader
end

class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },:default_url => "app/assets/images/images.jpg"
	 do_not_validate_attachment_file_type :image
	validates :image, presence: true
end

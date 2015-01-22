class CodexGuest < ActiveRecord::Base
  extend FriendlyId

  friendly_id :full_name, use: :slugged

  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  has_attached_file :audio,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :audio, :content_type => ["audio/mp3"]


  def s3_credentials
    {:bucket => Rails.application.secrets.s3_bucket,
     :access_key_id => Rails.application.secrets.s3_access_key_id,
     :secret_access_key => Rails.application.secrets.s3_secret_access_key}
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

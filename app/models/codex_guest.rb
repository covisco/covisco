class CodexGuest < ActiveRecord::Base
  extend FriendlyId

  friendly_id :full_name, use: :slugged

  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, :content_type => ["audio/mp3"]


  def s3_credentials
    {:bucket => Rails.application.secrets.s3_bucket,
     :access_key_id => Rails.application.secrets.s3_access_key_id,
     :secret_access_key => Rails.application.secrets.s3_secret_access_key}
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

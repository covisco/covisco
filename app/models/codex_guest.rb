class CodexGuest < ActiveRecord::Base
  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def s3_credentials
    {:bucket => Rails.application.secrets.s3_bucket,
     :access_key_id => Rails.application.secrets.s3_access_key_id,
     :secret_access_key => Rails.application.secrets.s3_secret_access_key}
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_one_time_password(encrypted: true)


   def send_two_factor_authentication_code(code)
     puts '***'
     puts code
     puts '***'
     puts self.provisioning_uri
     puts '***'
   end
end

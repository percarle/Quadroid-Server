class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :encryptable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # relations
  has_many :user_gcm_device_connections, class_name: 'UserGcmDeviceConnection'
  has_many :gcm_devices, through: :user_gcm_device_connections, class_name: 'Gcm::Device'

end

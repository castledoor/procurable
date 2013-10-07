class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stores
  has_many :items, through: :stores

  def store_owner?
    Store.all.each do |store|
      if user_id == store.user_id
        return true
      end
    end
  end
end



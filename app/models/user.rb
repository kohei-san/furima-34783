class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname,           presence: true, uniqueness: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :last_name_kana,     presence: true
  validates :first_name_kana,    presence: true
  validates :birthday,           presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて半角で設定してください' 
  validates_format_of [:last_name, :first_name], with: (/\A[あ-んア-ヶ一-龥々ー]+\z/), message: 'は全角の「ひらがな、カタカナ、漢字」で入力してください'
  validates_format_of [:last_name_kana, :first_name_kana], with: (/\A[ア-ン]+\z/), message: 'は全角の「カタカナ」で入力してください'
end
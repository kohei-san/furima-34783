class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname,           uniqueness: true
    validates :last_name,          format: {with: /\A[あ-んア-ヶ一-龥々ー]+\z/, message: 'は全角の「ひらがな、カタカナ、漢字」で入力してください'}
    validates :first_name,         format: {with: /\A[あ-んア-ヶ一-龥々ー]+\z/, message: 'は全角の「ひらがな、カタカナ、漢字」で入力してください'}
    validates :last_name_kana,     format: {with: /\A[ア-ン]+\z/, message: 'は全角の「カタカナ」で入力してください'}
    validates :first_name_kana,    format: {with: /\A[ア-ン]+\z/, message: 'は全角の「カタカナ」で入力してください'}
    validates :birthday           
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて半角で設定してください' 
end
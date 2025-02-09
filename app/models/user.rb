class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  # validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # ↑本リリース時にはコメントアウトをはずし、ビューにパスワード確認フォームをつける
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_many :items, dependent: :destroy
end

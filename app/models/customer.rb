class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :postal_code, format: {with: /\A[0-9]{7}\z/} #7桁の数字のみ有効
  validates :address, presence: true
  validates :phone_number, presence: true,format: {with: /\A\d{10,11}\z/} #10桁or11桁の数字のみ有効
  validates :password,presence: true, length: {minimum: 8}

  has_many :cart_items, dependent: :destroy
  has_many :shippings, dependent: :destroy
  enum customer_status:{ 有効: 0, 退会済: 1}

  acts_as_paranoid #paranoia

  def self.find_for_authentication(conditions)　#退会者はログインできない
    super(conditions.merge(:customer_status => "有効"))
  end

  has_many :comments, dependent: :destroy

end

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password

  has_one :shopping_list, :dependent => :destroy
  has_many :recipe_collections, :dependent => :destroy
  has_many :custom_products

  before_save :encrypt_password
  after_create :create_user_shopping_list, :create_recipe_collections

  validates_confirmation_of :password
  validates_presence_of     :password, :on => :create
  validates_presence_of     :password_confirmation, :on => :create
  validates_presence_of     :email
  validates_uniqueness_of   :email

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def create_user_shopping_list
    create_shopping_list(:name => "Min shoppinglista")
  end

  def create_recipe_collections
    standard  = recipe_collections.build(:name => "Min receptsamling")
    standard.create_collection_blocks("standard")
    standard.save

    week_plan = recipe_collections.build(:name => "Min veckoplan")
    week_plan.create_collection_blocks("week_plan")
    week_plan.save
  end

  def to_param
    "#{id}"
  end

end

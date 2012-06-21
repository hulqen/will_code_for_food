class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password

  has_one :shopping_list, :dependent => :destroy
  has_many :recipe_collections, :dependent => :destroy

  before_save :encrypt_password
  after_create :create_shopping_list, :create_recipe_collections

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

  def create_shopping_list
    shopping_list = ShoppingList.create!(:name => "Min shoppinglista")
  end

  def create_recipe_collections
    recipe_collections.create(:name => "Min receptsamling")
    recipe_collections.create(:name => "Min veckoplan")
    veckoplan = recipe_collections.find_by_name("Min veckoplan")
    veckoplan.create_collection_blocks("veckoplan")
  end

  def to_param
    "#{id}"
  end

end

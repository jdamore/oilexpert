require 'uuidtools'

module Fixtures

  @@fixture_users = Array.new

  ENVIRONMENTS = YAML.load_file 'features/fixtures/environments.yml'
  USERS = YAML.load_file 'features/fixtures/users.yml'

  def self.base_url
    ENVIRONMENTS[ENVIRONMENT]
  end

  def self.get_user fixture_user_id
    user = USERS[ENVIRONMENT][fixture_user_id.to_sym]
    generate_unique_user_name user if user[:username] == :unique
    @@fixture_users << user
    user
  end

  def self.create_user fixture_user_id
    fixture_user = get_user fixture_user_id
    user     = User.new
    user.name     = fixture_user[:username]
    user.password = fixture_user[:hashed_password]
    user.salt     = fixture_user[:salt]
    user.email    = fixture_user[:email]
    user.save
    @@fixture_users << user
  end

  def self.delete_user fixture_user
    users = User.find_all_by_name(fixture_user[:username])
    users.each do |user|
      user.destroy if user != nil
    end
  end

  def self.delete_users
    @@fixture_users.each do |created_user|
      delete_user created_user
    end
  end

  private
  def self.generate_unique_user_name user
    user[:username] = "cucumber#{UUIDTools::UUID.random_create}"
  end

end


World Fixtures
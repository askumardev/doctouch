class Product < ApplicationRecord
  has_rich_text :description
  validates :name, presence: true

  before_validation :normalize_name
  after_validation :log_validation

  before_save :before_save_callback
  after_save :after_save_callback

  before_create :before_create_callback
  after_create :after_create_callback

  #before_commit :before_commit_callback
  #before_create_commit :before_create_commit_callback

  after_commit :after_commit_callback
  after_create_commit :after_create_commit_callback

  private

  def normalize_name
    puts "****before validation****"
    self.name = name.downcase if name.present?
  end

  def log_validation
    puts "****after validation****"
  end

  def before_save_callback
    puts "****before save****"
  end

  def after_save_callback
    puts "****after save****"
  end

  def before_create_callback
    puts "****before create****"
  end

  def after_create_callback
    puts "****after create****"
  end

  def after_commit_callback
    puts "****after commit****"
  end

  def after_create_commit_callback
    puts "****after create commit****"
  end

  def before_create_callback
    puts "****before create callback****"
  end

  def before_create_commit_callback
    puts "****before create commit callback****"
  end
end

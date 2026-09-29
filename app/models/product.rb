class Product < ApplicationRecord
  has_rich_text :description
  validates :name, presence: true

  # Normalize the name before validations run, so validation sees the stored form.
  before_validation :normalize_name
  # Runs after validations, even when they add errors.
  after_validation :log_validation

  # Runs for both creates and updates, immediately before persistence.
  before_save :before_save_callback
  # Runs for both creates and updates, after persistence but before commit.
  after_save :after_save_callback

  # Runs only when inserting a new product, after before_save.
  before_create :before_create_callback
  # Runs only after a new product has been inserted, before after_save.
  after_create :after_create_callback

  # Commit callbacks run only after the enclosing database transaction succeeds.
  #before_commit :before_commit_callback
  #before_create_commit :before_create_commit_callback

  # Runs after a successful transaction for create, update, or destroy.
  after_commit :after_commit_callback
  # Runs after a successful transaction only when a product was created.
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

# An API key for access to the system
# Right now the keys are stored in plaintext in the DB. We could hash them, but then we could
# also only show the users the key once, which for our limited purposes will cause a lot of
# headaches.
class ApiKey < ApplicationRecord
  before_create :generate_key

  def to_s
    last_used_string = last_used.nil? ? "Never" : last_used.strftime("%FT%T")
    "id: #{id} | name: #{name} | last_used: #{last_used_string} | key: #{key}"
  end

  def generate_key
    self.key = SecureRandom.hex
  end
end

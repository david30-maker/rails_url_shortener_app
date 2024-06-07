class Url < ApplicationRecord
    validates :original_url, presence: true, formate: { with: URI::DEFAULT_PARSER.make_regexp}, uniqueness: true
    validates :short_url, uniqueness: true

    before_create :generate_short_url, :initialize_click_count

    private

    def generate_short_url
        self.short_url = loop do
            token = SecureRandom.urlsafe_base64(6)
            break token unless Url.exists?(short_url: token)
        end
    end

    def initialize_click_count
        self.click_count = 0
    end
end

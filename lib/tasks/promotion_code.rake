# lib/tasks/promotion_code.rake

namespace :promotion_code do
  desc "10 promotion codes"
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      discount = rand(100..1000)
      PromotionCode.create!(code: code, discount: discount)
    end
    puts "10 promotion codes generated"
  end
end

class Bar < ActiveRecord::Base
  def batz
    Rails.logger.info "Bar#batz[#{id}]: I'm going to sleep."
    sleep 1
    Rails.logger.info "Bar#batz[#{id}]: I'm up. What did I miss?"
    'batz'
  end
end

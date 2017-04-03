class Bar < ActiveRecord::Base
  def batz
    sleep 1
    'batz'
  end
end

module Api
  module V1
    class BarSerializer < ActiveModel::Serializer
      cache
      attributes :id, :batz
    end
  end
end

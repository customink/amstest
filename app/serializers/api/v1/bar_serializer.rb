module Api
  module V1
    class BarSerializer < ActiveModel::Serializer
      attributes :id, :batz
    end
  end
end

module Api
  module V1
    class FooSerializer < ActiveModel::Serializer
      cache
      attributes :id
      has_many :bars, serializer: BarSerializer
    end
  end
end

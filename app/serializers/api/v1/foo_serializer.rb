module Api
  module V1
    class FooSerializer < ActiveModel::Serializer
      attributes :id
      has_many :bars, serializer: BarSerializer
    end
  end
end

module Api
  module V1
    class FoosController < ApiController
      def index
        @foos = [foo1, foo2]
        render json: @foos
        # respond_to do |format|
        #   format.json do
        #     render json: @foos,
        #            root: false,
        #            each_serializer: FooSerializer
        #   end
        # end
      end

      private

      def foo1
        Foo.where(id: 1).first || Foo.create! do |f|
          f.id = 1
          f.bars << Bar.new
          f.bars << Bar.new
        end
      end

      def foo2
        Foo.where(id: 2).first || Foo.create! do |f|
          f.id = 2
          f.bars << Bar.new
        end
      end
    end
  end
end

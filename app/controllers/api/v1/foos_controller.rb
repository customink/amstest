module Api
  module V1
    class FoosController < ApiController
      before_action :before_action
      after_action :after_action

      def index
        @foos = [foo1, foo2]
        render json: @foos
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

      def before_action
        case params[:cache]
        when 'clear'.freeze then ActionController::Base.cache_store.clear
        when 'on'.freeze    then self.perform_caching = true # NOTE: AMS caching is not changed by this
        when 'off'.freeze   then self.perform_caching = false
        else nil # no-op
        end
      end

      def after_action
        Rails.logger.debug do
          {
            ams_config: {
              cache_store: ActiveModelSerializers.config.cache_store.present?,
              perform_caching: ActiveModelSerializers.config.perform_caching
            },
            serializers_config: {
              foo: Api::V1::FooSerializer._cache.present?,
              bar: Api::V1::BarSerializer._cache.present?
            },
            controller_config: {
              perform_caching: perform_caching
            },
            app_config: {
              cache_store: Rails.configuration.cache_store.present?,
              perform_caching: Rails.configuration.action_controller.perform_caching,
            }
          }.to_json
        end
      end
    end
  end
end

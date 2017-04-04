class Foo < ActiveRecord::Base
  has_many :bars

  def id
    Rails.logger.info "Foo#id[#{super}]: present!"
    super
  end
end

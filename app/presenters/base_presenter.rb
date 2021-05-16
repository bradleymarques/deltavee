class BasePresenter < SimpleDelegator
  # include Rails.application.helpers
  include Rails.application.routes.url_helpers

  def self.collection(objects, *args)
    objects.map { |obj| new(*([obj] + args)) }
  end

  def h
    ActionController::Base.helpers
  end

  def model
    __getobj__
  end
end

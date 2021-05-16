module Link
  class SystemLink < BasePresenter
    def to_s
      h.link_to(name, system_path(model))
    end
  end
end

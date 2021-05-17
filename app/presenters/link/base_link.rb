module Link
  class BaseLink < ::BasePresenter
    def initialize(model, options: {})
      super(model)
      @options = options
    end

    def text
      model.class.name
    end

    def path
      root_path
    end

    def to_s
      h.link_to(text, path, @options)
    end
  end
end

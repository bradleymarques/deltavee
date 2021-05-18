module Link
  class BaseLink < ::BasePresenter
    MAX_LENGTH = 40

    def initialize(model, options: {})
      super(model)
      @options = options
    end

    def text; end # Override in child classes

    def path; end # Override in child classes

    def to_s
      h.link_to(text, path, @options)
    end
  end
end

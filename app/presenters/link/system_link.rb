module Link
  class SystemLink < BaseLink
    def text
      name.truncate(40)
    end

    def path
      system_path(model)
    end
  end
end

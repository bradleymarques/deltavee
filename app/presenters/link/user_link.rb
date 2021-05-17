module Link
  class UserLink < BaseLink
    def text
      username.truncate(40)
    end

    def path
      user_path(model)
    end
  end
end

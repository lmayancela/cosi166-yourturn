# frozen_string_literal: true

module StaticPagesHelper
  def author_of(resource)
    logged_in? && resource.users.include?(User.find_by(id: current_user.id))
  end
end

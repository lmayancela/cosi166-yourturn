# frozen_string_literal: true

module StaticPagesHelper
  def author_of(resource)
    logged_in? && resource.creator_id.to_i == current_user.id
  end
end

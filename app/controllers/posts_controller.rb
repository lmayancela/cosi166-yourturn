# frozen_string_literal: true

class PostsController < ApplicationController
  include CableReady::Broadcaster

  def index
    @current_house = House.find_by(id: current_user.house_id)
    @posts = @current_house.posts.order(created_at: :desc)
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    post.update(user_name: current_user.name, house_id: current_user.house_id)
    cable_ready['timeline'].insert_adjacent_html(
      selector: '#timeline',
      position: 'afterbegin',
      html: render_to_string(partial: 'post', locals: { post: post })
    )
    cable_ready.broadcast
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end

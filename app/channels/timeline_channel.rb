# frozen_string_literal: true

class TimelineChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'timeline'
  end
end

class SectorsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sectors_#{params['sector_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
  	current_user.messages.create!(body: data['message'], sector_id: data['sector_id'])
    # process data sent from the page
  end
end
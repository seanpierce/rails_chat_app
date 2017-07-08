class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }

  def self.time
    created_at.strftime('%x')
  end

end

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @new_message = build_message

    if @new_message.save
      broadcast_message(@new_message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :chat_id)
  end

  def build_message
    current_user.messages.build(message_params)
  end

  def broadcast_message(message)
    chat = message.chat
    message.broadcast_append_to chat, target: "chat_#{chat.id}_messages", locals: { user: current_user, message: message }
  end
end

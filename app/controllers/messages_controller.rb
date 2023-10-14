class MessagesController < ApplicationController
  def create
    @new_message = current_user.messages.build(strong_params)

    if @new_message.save
      chat = @new_message.chat
      @new_message.broadcast_append_to chat, target: "chat_#{chat.id}_messages", locals: { user: current_user, message: @new_message }
    end
  end

  private

  def strong_params
    params.require(:message).permit(:text, :chat_id)
  end
end
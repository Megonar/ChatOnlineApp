class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @chat = Chat.find_by(title: message_params[:chat_title])
    @message = @chat.messages.new(text: message_params[:text], user_id: anonymous_user_id)

    if @message.save
      render json: { message: "Message successfully created" }, status: :created
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def anonymous_user_id
    1
  end

  def message_params
    params.permit(:chat_title, :text)
  end
end

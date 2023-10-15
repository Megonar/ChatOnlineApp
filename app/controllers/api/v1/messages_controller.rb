module Api
  module V1
    class MessagesController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_action :find_chat, only: :create

      def create
        if @chat
          @message = @chat.messages.new(text: message_params[:text], user: anonymous_user)

          if @message.save
            @message.broadcast_append_to(@chat, target: "chat_#{@chat.id}_messages", locals: { user: anonymous_user, message: @message })
            render json: { message: "Message successfully created" }, status: :created
          else
            render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { errors: "Chat not found" }, status: :not_found
        end
      end

      private

      def find_chat
        @chat = Chat.find_by(title: params[:chat_id])
      end

      def anonymous_user
        User.find_by(email: 'default_user@example.com')
      end

      def message_params
        params.permit(:text)
      end
    end
  end
end

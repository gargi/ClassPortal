class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def index
    @messages = Message.where("receiver = ?",current_user.id)
  end

  def show
      @message = Message.find(params[:c])
  end

  def destroy
    @message = Message.find(params[:c])
    @message.destroy
    redirect_to messages_index_path
  end

  def create
    @message = Message.new(message_params)
    @message[:sender] = current_user.id
    if @message.save
      redirect_to messages_index_path, notice: "Message Sent"
    else
      render 'new'
    end
  end

  def view_sent
    @messages = Message.where("sender = ?",current_user.id)
  end

  private
  def message_params
    params.require(:message).permit(:receiver,:subject,:message)
  end
end

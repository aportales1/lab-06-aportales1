class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.user = current_user
  
    if @message.save
      redirect_to @message, notice: "Message sent successfully."
    else
      render :new
    end
  end
  
  def edit
    @message = Message.find(params[:id])
  end
  
  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end
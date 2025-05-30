class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end
  
  def create
    @chat = Chat.new(chat_params)
    @chat.sender = current_user
  
    if @chat.save
      redirect_to @chat, notice: "Chat created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @chat = Chat.find(params[:id])
  end
  
  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  private
  
  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

end


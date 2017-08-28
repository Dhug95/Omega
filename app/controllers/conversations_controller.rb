class ConversationsController < ApplicationController

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def create
    recipient = User.find(params[:user_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    current_user.notify(recipient, "", nil, true, nil, false)
    redirect_to conversation_path(receipt.conversation)
  end

  def new
    @recipients = User.all - [current_user]
  end

  def destroy
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Messaggio correttamente eliminato!' }
      format.json { head :no_content }
    end
  end
end

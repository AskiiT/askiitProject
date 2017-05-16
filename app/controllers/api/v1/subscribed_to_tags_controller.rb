class API::V1::SubscribedToTagsController < ApplicationController
  before_action :set_subscribed_to_tag, only: [:show, :update]
  before_action :authenticate_user!, only:[:create]
  # GET /subscribed_to_tags
  def index
    user_id=params[:user_id].to_i
    @subscribed_to_tags = SubscribedToTag.tagsWhereSubscribed(user_id)
    unless @subscribed_to_tags.empty?
      render json: @subscribed_to_tags
    else
      render json: {data: {error: "No está subscrito a nada."}}
    end
  end

  # GET /subscribed_to_tags/1
  def show
    render json: @subscribed_to_tag
  end

  # POST /subscribed_to_tags
  def create
    user_id=current_user.id
    tag_id=params[:tag_id]
    m = tag_id.to_i
    if m.to_s != tag_id.to_s
      u=Tag.tag_id_name(tag_id)
      tag_id=u.to_i
    end
    @subscribed_to_tag = SubscribedToTag.new(:user_id => user_id, :tag_id => tag_id)

    if @subscribed_to_tag.save
      @user=User.find_by_id(user_id)
      render json: @user, status: :created
    else
      render json: @subscribed_to_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscribed_to_tags/1
  def update
    if @subscribed_to_tag.update(subscribed_to_tag_params)
      render json: @subscribed_to_tag
    else
      render json: @subscribed_to_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscribed_to_tags/1
  def destroy
    user_id=current_user.id
    tag_id=params[:tag_id]
    m = tag_id.to_i
    if m.to_s != tag_id.to_s
      u=Tag.tag_id_name(tag_id)
      tag_id=u.to_i
    end
    @subscribed_to_tag = SubscribedToTag.find_by(:user_id => user_id, :tag_id => tag_id)

    @subscribed_to_tag.destroy
    @user=User.find_by_id(user_id)
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribed_to_tag
      @subscribed_to_tag = SubscribedToTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscribed_to_tag_params
      params.require(:subscribed_to_tag).permit(:user_id, :tag_id)
    end
end

class SubscribedToTagsController < ApplicationController
  before_action :set_subscribed_to_tag, only: [:show, :update, :destroy]

  # GET /subscribed_to_tags
  def index
    @subscribed_to_tags = SubscribedToTag.all

    render json: @subscribed_to_tags
  end

  # GET /subscribed_to_tags/1
  def show
    render json: @subscribed_to_tag
  end

  # POST /subscribed_to_tags
  def create
    @subscribed_to_tag = SubscribedToTag.new(subscribed_to_tag_params)

    if @subscribed_to_tag.save
      render json: @subscribed_to_tag, status: :created, location: @subscribed_to_tag
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
    @subscribed_to_tag.destroy
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

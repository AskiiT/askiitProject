class API::V1::TopicsController < ApplicationController
  before_action :set_topic, only: [:update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
    f= params[:page]
    unless f.nil?
      @topics = Topic.load_topics.page(f)
    end
    render json: @topics
  end

  # GET /topics/1
  def show
    g=params[:id]
    m=g.to_i
    
    if m.to_s != g.to_s
      u=Topic.topic_id_name(params[:id])
      g=u.to_i
    end

    @topic = Topic.find(g)

    render json: @topic
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
  end


  def topics_in_question
    @topic=Topic.topic_in_question(params[:question_id])
    render json: @topic
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:topic_name, :topic_description)
    end
end

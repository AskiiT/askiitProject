class API::V1::TopicsController < ApplicationController
  before_action :set_topic, only: [:update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
    f= params[:page]
    unless f.nil?
      @topics = Topic.load_topics.page(f)
    else
      @topics = Topic.all
    end

    if @topics.empty?
      render json: 
        { data:
          {
            error: "No more topics to show."
          }
        }
    else
      render json: @topics
    end

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
      render json: @topic, status: :created
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

  #####
  ##Custom Routes
  ####

  def topics_in_question
    @topic=Topic.topic_in_question(params[:question_id])
    render json: @topic
  end

  def used_by
    @users= User.user_made_topic(params[:topic_id]).page(params[:page])
    if @users.empty?
      render json: 
        { data:
          {
            error: "No more users to show."
          }
        }
    else
      render json: @users
    end
  end

  def search
    @topics=Topic.topics_by_name(params[:topic_name]).page(params[:page])
    if @topics.empty?
      render json: 
        { data:
          {
            error: "No more topics to show."
          }
        }
    else
      render json: @topics
    end
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

class API::V1::TagsController < ApplicationController
  before_action :set_tag, only: [:update, :destroy]


  
  # GET /tags
  def index
    @tags = Tag.all
    f= params[:page]
    unless f.nil?
      @tags = Tag.load_tags.page(f)
    end

    q=params[:q]
    unless q.nil?
      @tags=@tags.where("lower(tags.tag_name) LIKE ?", "%#{q.downcase}%")
    end

    if @tags.empty?
      render json: 
        { data:
          {
            error: "No more tags to show."
          }
        }
    else
      render json: @tags
    end

  end

  # GET /tags/1
  def show
    g=params[:id]
    m=g.to_i
    if m.to_s != g.to_s
      u=Tag.tag_id_name(params[:id])
      g=u.to_i
    end
    @tag = Tag.find(g)
    render json: @tag
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    g=params[:topic]
    if g.nil?
      render json: {data: {error: "Topic no puede estar vacio"}}
    else
      m=g.to_i

      if m.to_s != g.to_s
        u=Topic.topic_id_name(params[:topic])
        g=u.to_i
      end
      @tag.topic_id=g

      if @tag.save
        render json: @tag, status: :created
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end
  ###########
  ###Custom Routes
  ###########


  def tags_in_question
    @tag= Tag.tags_in_question(params[:question_id]).page(params[:page])
    render json: @tag
  end

  def used_by
    @users= User.user_made_tag(params[:tag_id]).page(params[:page])

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
    @tags=Tag.tags_by_name(params[:tag_name]).page(params[:page])
    if @tags.empty?
      render json: 
        { data:
          {
            error: "No more tags to show."
          }
        }
    else
      render json: @tags
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:tag_name)
    end
end

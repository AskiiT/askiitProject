class API::V1::NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update, :destroy]
   before_action :authenticate_user!, only:[:index, :destroy, :clear, :read_all]

  # GET /postulates
  def index
    user_id=current_user.id
    p=params[:page]
    if p.nil?
      p=1
    end
    @notifications = Notification.load_notifications(user_id).page(p)
    if @notifications.empty?
      render json: 
        { data:
          {
            notifications: "No hay notificaciones para mostrar",
            not_readed: 0
          }
       }
    else
      amount=Notification.where("user_id = ? AND read = ?", user_id, 0).size
      render json: {data:
        {
        notifications: @notifications,
        not_readed: amount
        }
      }
    end
  end

  # GET /notifications/1
  def show
    render json: @notification
  end
  def read
    @notifications=Notification.find_by_id(params[:notification_id])
    @notifications.read=1
    @notifications.save
    @notification=Notification.load_notifications(user_id).page(p)
    amount=Notification.where("user_id = ? AND read = ?", user_id, 0).size
    render json: {data:
        {
        notifications: @notification,
        not_readed: amount
        }
      }
  end

  def read_all
    user_id=current_user.id
    @notifications=Notification.where("user_id = ?", user_id)
    unless @notifications.nil?
      @notifications.update_all(read: 1)
    end
    @notification=Notification.load_notifications(user_id).page(p)
    amount=Notification.where("user_id = ? AND read = ?", user_id, 0).size
    render json: {data:
        {
        notifications: @notification,
        not_readed: amount
        }
    }
  end
  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    user_id=current_user.id
    if(@notification.user_id != user_id)
      render json: 
        { data:
          {
            error: "Usted no puede eliminar esta notificación"
          }
       }
    else
      @notification.destroy
    end
  end
  def clear
    user_id=current_user.id
    @notifications = Notification.where("user_id = ?", user_id)
    @notifications.destroy_all
    render json: 
        { data:
          {
            notifications: "No hay notificaciones para mostrar",
            not_readed: 0
          }
       }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:body, :read)
    end
end

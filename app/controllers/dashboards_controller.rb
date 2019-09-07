class DashboardsController < ApplicationController
  def index
    authorize! :index, @users
    @users = User.all.order("id ASC")
  end

  def edit_user
    @user = User.find(params[:id])
    authorize! :index, @user
    if @user.admin?
      @user.visit!
    else
      @user.admin!
    end
    redirect_to dashboards_index_path, alert: 'El usuario fue modificado'
  end

  def delete_user
    @user = User.find(params[:id])
    authorize! :index, @user
    @user.destroy
    redirect_to dashboards_index_path, alert: 'El usuario fue eliminado'
  end
end

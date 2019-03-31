class BasesController < ApplicationController
  before_action :admin_user, only: [:index, :new, :edit, :destroy]
  
  def index
    @title = '拠点一覧'
    @bases = Base.all
  end

  def new
    @title = '拠点情報の追加'
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = '拠点を追加しました'
      redirect_to bases_path
    else
      render 'new'
    end
  end

  def edit
    @title = '拠点情報の編集'
    @base = Base.find(params[:id])
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success] = '拠点情報を更新しました'
      redirect_to bases_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Base.find(params[:id]).destroy
    flash[:success] = '削除しました'
    redirect_to bases_path
  end
  
  private

    def base_params
      params.require(:base).permit(:base_number, :base_name, :attendance_type)
    end
    
    # beforeアクション
    
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.is_admin?
    end
end

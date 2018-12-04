class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create]
  protect_from_forgery except: [:update, :create]

  # 会員一覧
  def index
    @users = User.order("id")
  end

  # 検索
  def search
    @users = User.search(params[:q])
    render "index"
  end

  # 会員情報の詳細
  def show
    @user = User.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @user = User.new(birthday: Date.new(1980, 1, 1))
  end

  # 編集フォーム
  def edit
    @user = User.find(params[:id])
  end

  # 会員の新規登録
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "会員情報を登録しました。"
    else
      render "new"
    end
  end

  # 会員情報の更新
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user, notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  # 会員の削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "会員を削除しました。"
  end
end

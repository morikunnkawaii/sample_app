class ListsController < ApplicationController
  def new
    #Viewへ渡す為のインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # 1.%2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
     # 3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
     # 4. トップ画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id]) #データ（レコード）を1つ取得
    list.destroy #データを削除
    redirect_to '/lists' #　投稿一覧へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
 
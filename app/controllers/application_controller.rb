class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  #権限の設定　deviseのメソッド　コントローラー内基本一番上
  #ログイン認証が成功していないと、トップページ以外の画面（ログインと新規登録は除く）は表示できない仕様
  #authenticate オーセンティケート　認証
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseの機能が使われる前に、configure_permitted_parametersをする

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected #呼び出された他のコントローラからも参照することができます。

  def configure_permitted_parameters #構成(configure)#許可された(permitted)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #サインアップ（:sign_up）時に、入力した内容（:name）を許可(permit)。
  end
end

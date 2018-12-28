module TopHelper
  def load_button_title(flash)
    if flash[:alert].blank?
      '読み込む'
    else
      'リトライ'
    end
  end
end

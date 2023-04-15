module ApplicationHelper
  # 各ページのタイトル設定、検索結果一覧ページで活用
  def full_title(page_title = '')
    base_title = 'HowToKeepBigFish'
    if page_title.empty?
      base_title
    else
      base_title + ' | ' + page_title
    end
  end

  # 各ページの説明文（120文字前後）、検索結果一覧ページで活用
  def full_description(page_description = '')
    base_description = 'HowToKeepBigFishは、大型魚や古代魚がどれくらいの大きさに成長するか、水槽と比較することで視覚的に把握することができるWebサービスです'
    if page_description.empty?
      base_description
    else
      base_description + ' | ' + page_description
    end
  end

  # 各ページの説明文（50文字前後）、SNS等でシェアされた際に活用
  def og_description(page_description = '')
    base_description = 'HowToKeepBigFishは、大型魚や古代魚の飼育をサポートするサービスです'
    if page_description.empty?
      base_description
    else
      page_description
    end
  end

  # 各ページのイメージ画像、SNS等でシェアされた際に活用
  def og_image(page_image = '')
    base_image = ""
    if page_image.empty?
      base_image
    else
      page_image
    end
  end
end

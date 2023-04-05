class ThumbnailCreator
  require 'mini_magick'

  # ベースとなる画像
  BASE_IMAGE_PATH = MiniMagick::Image.open('') # 投稿画像
  # 文字のサイズや位置
  GRAVITY = 'center'.freeze
  FONT = '' # フォントを何処から引っ張ってくるか
  TITLE_FONT_SIZE = 80
  USER_NAME_FONT_SIZE = 60
  TITLE_TEXT_POSITION = '0,-130'.freeze
  USER_NAME_TEXT_POSITION = '0, 300'.freeze
  INDENTION_COUNT = 20
  ROW_LIMIT = 2

  class << self
    def build(user_name, fish_name, post_image)
      user_name = prepare_text(user_name)
      fish_name = prepare_text(fish_name)
      image = if Rails.env.production?
                MiniMagick::Image.open(post_image) # 本番環境はa3から画像を取得したい
              else
                MiniMagick::Image.open(post_image) # それ以外はローカルから取得したい
              end
      

  class << self
    def build(fish_name, thumbnail, user_name)
      user_name = prepare_text(user_name)
      fish_name = prepare_text(fish_name)
      image = if thumbnail.present?
                image_url = get_uploaded_image(thumbnail)
                if Rails.env.production?
                  MiniMagick::Image.open(image_url)
                else
                  MiniMagick::Image.open("#{Rails.root.to_s}/public/#{image_url}")
                end
              else
                MiniMagick::Image.open(BASE_IMAGE_PATH)
              end
      # タイトルの入った画像を作る
      image_with_title = image.combine_options do |config|
        config.font FONT
        config.fill 'white'
        config.gravity GRAVITY
        config.pointsize TITLE_FONT_SIZE
        config.draw "text #{TITLE_TEXT_POSITION} '#{interview_title}'"
      end
      # タイトル入りの画像に名前を入れる
      image_with_title.combine_options do |config|
        config.font FONT
        config.fill 'white'
        config.gravity GRAVITY
        config.pointsize USER_NAME_FONT_SIZE
        config.draw "text #{USER_NAME_TEXT_POSITION} '#{user_name}'"
      end
    end

    private

    def get_uploaded_image(image, method = "thumb")
      self.send(method.to_sym, image)
    end
    
    def thumb(image)
      unless image.blank?
        return image.url.to_s
      end
    
      image.url.to_s
    end
    
    def prepare_text(text)
      text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
  end
end
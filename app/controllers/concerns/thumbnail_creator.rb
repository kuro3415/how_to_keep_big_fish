class ThumbnailCreator
  require 'mini_magick'

  # 文字のサイズや位置
  GRAVITY = 'center'.freeze
  FONT = './app/assets/fonts/Senobi-Gothic-Bold.ttf'.freeze
  USER_NAME_FONT_SIZE = 60
  FISH_NAME_FONT_SIZE = 80
  USER_NAME_TEXT_POSITION = '0, 300'.freeze
  FISH_NAME_TEXT_POSITION = '0,-130'.freeze
  INDENTION_COUNT = 20
  ROW_LIMIT = 2

  class << self
    def build(user_name, fish_name, post_image)
      user_name = prepare_text(user_name)
      fish_name = prepare_text(fish_name)
      image = if Rails.env.production?
                MiniMagick::Image.open(post_image.to_s) # 本番環境はa3から画像を取得したい
              else
                MiniMagick::Image.open("./public#{post_image}") # それ以外はローカルから取得したい
              end
      # ユーザーの名前が入った画像を作る
      image_with_name = image.combine_options do |config|
        config.font FONT
        config.fill 'white'
        config.gravity GRAVITY
        config.pointsize USER_NAME_FONT_SIZE
        config.draw "text #{USER_NAME_TEXT_POSITION} '#{user_name}'"
      end
      # ユーザーの名前入りの画像に魚の名前を入れる
      image_with_name.combine_options do |config|
        config.font FONT
        config.fill 'white'
        config.gravity GRAVITY
        config.pointsize FISH_NAME_FONT_SIZE
        config.draw "text #{FISH_NAME_TEXT_POSITION} '#{fish_name}'"
      end
    end

    private
    
    # 背景にいい感じに収まるように文字を調整して返却
    def prepare_text(text)
      text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
  end
end
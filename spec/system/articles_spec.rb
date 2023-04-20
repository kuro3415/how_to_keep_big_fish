require 'rails_helper'

RSpec.describe "Articles", type: :system do
  let!(:fish) { create(:fish) }
  let(:article) { create(:article) }

  describe '画像の表示' do
    before do
      @article = create(:article)
      visit article_path(@article)
    end

    context '魚サイズのセレクトを10cmに変更' do
      it '10cmの魚の画像が表示される' do
        expect(page).to have_css('img.fish_img')
        expect(page).to have_selector("img[src$='#{@article.fish.fish_image_s}']")
      end
    end

    context '魚サイズのセレクトを60cmに変更' do
      it '60cmの魚の画像が表示される' do
        select @article.fish.medium, from: 'fish'
        expect(page).to have_css('img.fish_img')
        expect(page).to have_selector("img[src$='#{@article.fish.fish_image_m}']")
      end
    end

    context '魚サイズのセレクトを110cmに変更' do
      it '100cmの魚の画像が表示される' do
        select @article.fish.maximum, from: 'fish'
        expect(page).to have_css('img.fish_img')
        expect(page).to have_selector("img[src$='#{@article.fish.fish_image_l}']")
      end
    end
  end
end

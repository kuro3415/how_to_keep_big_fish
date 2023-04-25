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

    describe '正面' do
      context '水槽サイズを90x60x45に変更' do
        it '90x60x45の水槽の画像が表示される' do
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x45.jpg']")
        end
      end

      context '水槽サイズを90x60x60に変更' do
        it '90x60x60の水槽の画像が表示される' do
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x60.jpg']")
        end
      end

      context '水槽サイズを90x60x90に変更' do
        it '90x60x90の水槽の画像が表示される' do
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x90.jpg']")
        end
      end

      context '水槽サイズを90x45x45に変更' do
        it '90x45x45の水槽の画像が表示される' do
          select '45', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x45.jpg']")
        end
      end

      context '水槽サイズを90x45x60に変更' do
        it '90x45x60の水槽の画像が表示される' do
          select '45', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x60.jpg']")
        end
      end

      context '水槽サイズを90x45x90に変更' do
        it '90x45x90の水槽の画像が表示される' do
          select '45', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x90.jpg']")
        end
      end

      context '水槽サイズを90x90x45に変更' do
        it '90x90x45の水槽の画像が表示される' do
          select '90', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x45.jpg']")
        end
      end

      context '水槽サイズを90x90x60に変更' do
        it '90x90x60の水槽の画像が表示される' do
          select '90', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x60.jpg']")
        end
      end

      context '水槽サイズを90x90x90に変更' do
        it '90x90x90の水槽の画像が表示される' do
          select '90', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/90x60x90.jpg']")
        end
      end

      context '水槽サイズを120x60x45に変更' do
        it '120x60x45の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x45.jpg']")
        end
      end

      context '水槽サイズを120x60x60に変更' do
        it '120x60x60の水槽の画像が表示される' do
          select '120', from: 'width'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x60.jpg']")
        end
      end

      context '水槽サイズを120x60x90に変更' do
        it '120x60x90の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x90.jpg']")
        end
      end

      context '水槽サイズを120x45x45に変更' do
        it '120x45x45の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x45.jpg']")
        end
      end

      context '水槽サイズを120x45x60に変更' do
        it '120x45x60の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x60.jpg']")
        end
      end

      context '水槽サイズを120x45x90に変更' do
        it '120x45x90の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x90.jpg']")
        end
      end

      context '水槽サイズを120x90x45に変更' do
        it '120x90x45の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x45.jpg']")
        end
      end

      context '水槽サイズを120x90x60に変更' do
        it '120x90x60の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x60.jpg']")
        end
      end

      context '水槽サイズを120x90x90に変更' do
        it '120x90x90の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/120x60x90.jpg']")
        end
      end

      context '水槽サイズを150x60x45に変更' do
        it '150x60x45の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x45.jpg']")
        end
      end

      context '水槽サイズを150x60x60に変更' do
        it '150x60x60の水槽の画像が表示される' do
          select '150', from: 'width'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x60.jpg']")
        end
      end

      context '水槽サイズを150x60x90に変更' do
        it '150x60x90の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x90.jpg']")
        end
      end

      context '水槽サイズを150x45x45に変更' do
        it '150x45x45の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x45.jpg']")
        end
      end

      context '水槽サイズを150x45x60に変更' do
        it '150x45x60の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x60.jpg']")
        end
      end

      context '水槽サイズを150x45x90に変更' do
        it '150x45x90の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x90.jpg']")
        end
      end

      context '水槽サイズを150x90x45に変更' do
        it '150x90x45の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x45.jpg']")
        end
      end

      context '水槽サイズを150x90x60に変更' do
        it '150x90x60の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x60.jpg']")
        end
      end

      context '水槽サイズを150x90x90に変更' do
        it '150x90x90の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/150x60x90.jpg']")
        end
      end

      context '水槽サイズを180x60x45に変更' do
        it '180x60x45の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x45.jpg']")
        end
      end

      context '水槽サイズを180x60x60に変更' do
        it '180x60x60の水槽の画像が表示される' do
          select '180', from: 'width'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x60.jpg']")
        end
      end

      context '水槽サイズを180x60x90に変更' do
        it '180x60x90の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x90.jpg']")
        end
      end

      context '水槽サイズを180x45x45に変更' do
        it '180x45x45の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x45.jpg']")
        end
      end

      context '水槽サイズを180x45x60に変更' do
        it '180x45x60の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x60.jpg']")
        end
      end

      context '水槽サイズを180x45x90に変更' do
        it '180x45x90の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x90.jpg']")
        end
      end

      context '水槽サイズを180x90x45に変更' do
        it '180x90x45の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'depth'
          select '45', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x45.jpg']")
        end
      end

      context '水槽サイズを180x90x60に変更' do
        it '180x90x60の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'depth'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x60.jpg']")
        end
      end

      context '水槽サイズを180x90x90に変更' do
        it '180x90x90の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'depth'
          select '90', from: 'length'
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/front/180x60x90.jpg']")
        end
      end
    end

    describe '側面' do
      context '水槽サイズを90x60x45に変更' do
        it '90x60x45の水槽の画像が表示される' do
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x45.jpg']")
        end
      end

      context '水槽サイズを90x60x60に変更' do
        it '90x60x60の水槽の画像が表示される' do
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x60.jpg']")
        end
      end

      context '水槽サイズを90x60x90に変更' do
        it '90x60x90の水槽の画像が表示される' do
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x90.jpg']")
        end
      end

      context '水槽サイズを90x45x45に変更' do
        it '90x45x45の水槽の画像が表示される' do
          select '45', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x45.jpg']")
        end
      end

      context '水槽サイズを90x45x60に変更' do
        it '90x45x60の水槽の画像が表示される' do
          select '45', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x60.jpg']")
        end
      end

      context '水槽サイズを90x45x90に変更' do
        it '90x45x90の水槽の画像が表示される' do
          select '45', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x90.jpg']")
        end
      end

      context '水槽サイズを90x90x45に変更' do
        it '90x90x45の水槽の画像が表示される' do
          select '90', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x45.jpg']")
        end
      end

      context '水槽サイズを90x90x60に変更' do
        it '90x90x60の水槽の画像が表示される' do
          select '90', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x60.jpg']")
        end
      end

      context '水槽サイズを90x90x90に変更' do
        it '90x90x90の水槽の画像が表示される' do
          select '90', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x90.jpg']")
        end
      end

      context '水槽サイズを120x60x45に変更' do
        it '120x60x45の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x45.jpg']")
        end
      end

      context '水槽サイズを120x60x60に変更' do
        it '120x60x60の水槽の画像が表示される' do
          select '120', from: 'width'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x60.jpg']")
        end
      end

      context '水槽サイズを120x60x90に変更' do
        it '120x60x90の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x90.jpg']")
        end
      end

      context '水槽サイズを120x45x45に変更' do
        it '120x45x45の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x45.jpg']")
        end
      end

      context '水槽サイズを120x45x60に変更' do
        it '120x45x60の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x60.jpg']")
        end
      end

      context '水槽サイズを120x45x90に変更' do
        it '120x45x90の水槽の画像が表示される' do
          select '120', from: 'width'
          select '45', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x90.jpg']")
        end
      end

      context '水槽サイズを120x90x45に変更' do
        it '120x90x45の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x45.jpg']")
        end
      end

      context '水槽サイズを120x90x60に変更' do
        it '120x90x60の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x60.jpg']")
        end
      end

      context '水槽サイズを120x90x90に変更' do
        it '120x90x90の水槽の画像が表示される' do
          select '120', from: 'width'
          select '90', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x90.jpg']")
        end
      end

      context '水槽サイズを150x60x45に変更' do
        it '150x60x45の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x45.jpg']")
        end
      end

      context '水槽サイズを150x60x60に変更' do
        it '150x60x60の水槽の画像が表示される' do
          select '150', from: 'width'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x60.jpg']")
        end
      end

      context '水槽サイズを150x60x90に変更' do
        it '150x60x90の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x90.jpg']")
        end
      end

      context '水槽サイズを150x45x45に変更' do
        it '150x45x45の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x45.jpg']")
        end
      end

      context '水槽サイズを150x45x60に変更' do
        it '150x45x60の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x60.jpg']")
        end
      end

      context '水槽サイズを150x45x90に変更' do
        it '150x45x90の水槽の画像が表示される' do
          select '150', from: 'width'
          select '45', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x90.jpg']")
        end
      end

      context '水槽サイズを150x90x45に変更' do
        it '150x90x45の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x45.jpg']")
        end
      end

      context '水槽サイズを150x90x60に変更' do
        it '150x90x60の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x60.jpg']")
        end
      end

      context '水槽サイズを150x90x90に変更' do
        it '150x90x90の水槽の画像が表示される' do
          select '150', from: 'width'
          select '90', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x90.jpg']")
        end
      end

      context '水槽サイズを180x60x45に変更' do
        it '180x60x45の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x45.jpg']")
        end
      end

      context '水槽サイズを180x60x60に変更' do
        it '180x60x60の水槽の画像が表示される' do
          select '180', from: 'width'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x60.jpg']")
        end
      end

      context '水槽サイズを180x60x90に変更' do
        it '180x60x90の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x60x90.jpg']")
        end
      end

      context '水槽サイズを180x45x45に変更' do
        it '180x45x45の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x45.jpg']")
        end
      end

      context '水槽サイズを180x45x60に変更' do
        it '180x45x60の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x60.jpg']")
        end
      end

      context '水槽サイズを180x45x90に変更' do
        it '180x45x90の水槽の画像が表示される' do
          select '180', from: 'width'
          select '45', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x45x90.jpg']")
        end
      end

      context '水槽サイズを180x90x45に変更' do
        it '180x90x45の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'depth'
          select '45', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x45.jpg']")
        end
      end

      context '水槽サイズを180x90x60に変更' do
        it '180x90x60の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'depth'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x60.jpg']")
        end
      end

      context '水槽サイズを180x90x90に変更' do
        it '180x90x90の水槽の画像が表示される' do
          select '180', from: 'width'
          select '90', from: 'depth'
          select '90', from: 'length'
          find('input[type="radio"][value="side"]').click
          expect(page).to have_css('img.fish_tank_img')
          expect(page).to have_selector("img[src$='/images/fish_tanks/side/120x90x90.jpg']")
        end
      end
    end
  end
end 

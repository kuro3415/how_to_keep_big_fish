FactoryBot.define do
  factory :fish do
    name {'シルバーアロワナ'}
    minimum {'10cm'}
    medium {'60cm'}
    maximum {'110cm'}
    fish_image_s {'/images/fishes/silver_arowana/silver_arowana_S.png'}
    fish_image_m {'/images/fishes/silver_arowana/silver_arowana_M.png'}
    fish_image_l {'/images/fishes/silver_arowana/silver_arowana_L.png'}
  end
end

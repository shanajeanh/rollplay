FactoryGirl.define do
  factory :feats do
    title 'Precise Shot'
    type 'Combat'
    prerequisites 'Point Blank Shot'
    summary 'No penalty for shooting into melee.'
    description 'You are adept at firing ranged attacks into melee.'
    benefit 'You can shoot or throw ranged weapons at an opponent engaged in melee without taking the standard –4 penalty on your attack roll.'
    special 'this isn\'t a very special feat'

    character
  end
end

FactoryGirl.define do
  factory :character do
    name 'Georgia Mason'
    character_class 'Reporter'
    character_race 'Human'
    description 'Her zombie eyes give her darkvision'
    level 5
    appearance 'Short black hair, sunglasses, creepy zombie eyes'
    alignment 'NG'
    deity 'The News'
    str 8
    dex 14
    con 10
    int 17
    wis 9
    cha 13
    hp 25
    fort 0
    ref 3
    will 3
    bab 3

    user
  end

  factory :skill do
    name 'Craft (writing)'
    ability 'Int'
  end

  factory :rank do
    added_ranks 10
    class_skill true

    character
    skill
  end

  factory :feat do
    title 'Precise Shot'
    feat_type 'Combat'
    prerequisites 'Point Blank Shot'
    summary 'No penalty for shooting into melee.'
    description 'You are adept at firing ranged attacks into melee.'
    benefit 'You can shoot or throw ranged weapons at an opponent engaged in melee without taking the standard –4 penalty on your attack roll.'
    special 'this isn\'t a very special feat'

    character
  end
end

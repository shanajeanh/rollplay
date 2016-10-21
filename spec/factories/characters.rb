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
end

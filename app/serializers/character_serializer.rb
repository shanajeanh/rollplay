class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :skills, :ranks, :feats
end

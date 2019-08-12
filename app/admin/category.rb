ActiveAdmin.register Category do
  has_many :categories, dependent: :nullify
end

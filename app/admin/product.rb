ActiveAdmin.register Product do
  has_many :products, dependent: :nullify
end

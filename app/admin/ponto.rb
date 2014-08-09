ActiveAdmin.register Ponto do

  index do
    selectable_column
    column :id
    column :logradouro
    column :cidade
    column :state
    column :created_at
    column :updated_at
    actions
  end

  filter :logradouro
  filter :cidade
  filter :state
  filter :cep
  filter :created_at
  filter :updated_at

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  permit_params :logradouro, :cidade, :state_id, :cep
end

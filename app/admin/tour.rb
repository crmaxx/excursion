ActiveAdmin.register Tour do

  controller do
    def scoped_collection
      super.includes :city, :categories # eager loading associations
    end

    def permitted_params
      params.permit!
    end

    def create
      params[:tour][:category_ids].reject!(&:empty?)
      create!
    end

    def update
      params[:tour][:category_ids].reject!(&:empty?)
      update!
    end
  end

  index do
    column :name
    column "Categories" do |tour|
      (tour.categories.map{ |t| t.name }).join(', ').html_safe
    end
    column "City" do |tour|
      tour.city ? tour.city.name : 'Empty'
    end
    column :description do |tour|
      truncate tour.description
    end
    column :public
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Categories" do # Make a panel that holds inputs for lifestyles
      f.input :categories, as: :check_boxes, collection: Category.all # Use formtastic to output my collection of checkboxes
    end
    f.inputs # Include the default inputs
    f.actions # Include the default actions
  end

  show do |ad|
    attributes_table do
      row :name
      row "Categories" do |tour|
        (tour.categories.map{ |t| t.name }).join(', ').html_safe
      end
      row "City" do |tour|
        tour.city ? tour.city.name : 'Empty'
      end
      row :description
      row :public
      row :created_at
      row :updated_at
    end
  end
end

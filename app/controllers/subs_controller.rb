class SubsController < ApplicationController
  # Skinny Controllers / Fat Models

    # Read / GET
    #   shows all of the items in the model
    #   index @model_names = Model_name.all

    #   search record to update / render edit form
    #   edit @model_name = Model_name.find(params[:id])

    #   search record / shows a specific record
    #   show @model_name = Model_name.find(params[:id])

    #   creates record in memory / rendering the new form
    #   new @model_name = Model_name.new

    # Create / Post
    # create Model_name.create(model_name_params)
  
    # Update / Put/patch
    # update  Model_name.find(params[:id]).update(model_name_params)

    # Destroy / Delete
    # destroy Model_name.find(param[:id]).destroy

    # model_name_params
    # private
    # def model_name_params
    #   params.require(:model_name).permit(:everything the model has)
    # end


    #callbacks (before_action, after_action, skip_before_action, skip_after_action)

  before_action :find_sub, only: [:show, :update, :edit, :destroy]

  def index
    @subs = Sub.all
    # render index.html.erb

    render partial: 'form'
  end

  def show
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    # render edit.html.erb
    render partial: 'form'
  end

  def update
    if @sub.update(sub_params)
      redirect_to @sub
    else 
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private
  def sub_params
    params.require(:sub).permis(:name)
  end

  def find_sub
    @sub = Sub.find(params[:id])
  end
end

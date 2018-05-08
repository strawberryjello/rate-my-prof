class MyClassesController < ApplicationController
  before_action :set_my_class, only: [:show, :edit, :update, :destroy]

  # GET /my_classes
  def index
    @my_classes = MyClass.all
  end

  # GET /my_classes/1
  def show
  end

  # GET /my_classes/new
  def new
    @my_class = MyClass.new
  end

  # GET /my_classes/1/edit
  def edit
  end

  # POST /my_classes
  def create
    @my_class = MyClass.new(my_class_params)

    if @my_class.save
      redirect_to @my_class, notice: 'My class was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /my_classes/1
  def update
    if @my_class.update(my_class_params)
      redirect_to @my_class, notice: 'My class was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /my_classes/1
  def destroy
    @my_class.destroy
    redirect_to my_classes_url, notice: 'My class was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_class
      @my_class = MyClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def my_class_params
      params.require(:my_class).permit(:name)
    end
end

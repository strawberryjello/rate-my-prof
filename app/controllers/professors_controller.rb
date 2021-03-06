class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :set_classes, only: [:new, :create, :edit, :update]

  # GET /professors
  def index
    @professors = Professor.all
  end

  # GET /professors/1
  def show
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  def create
    @professor = Professor.new(professor_params)

    if @professor.save
      @professor.my_class_ids = class_ids
      redirect_to @professor, notice: 'Professor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /professors/1
  def update
    if @professor.update(professor_params)
      @professor.my_class_ids = class_ids
      redirect_to @professor, notice: 'Professor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professors/1
  def destroy
    @professor.destroy
    redirect_to professors_url, notice: 'Professor was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def set_classes
      @my_classes = MyClass.all
    end

    # Only allow a trusted parameter "white list" through.
    def professor_params
      params.require(:professor).permit(:first_name, :last_name)
    end

    def class_ids
      params[:professor][:my_class_ids].reject { |id| id.blank? }
    end
end

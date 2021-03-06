class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_professor

  # GET /reviews
  def index
    @reviews = @professor.reviews
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to professor_path(@review.professor.id), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to professor_reviews_url(@professor), notice: 'Review was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_professor
      @professor = Professor.find(params[:professor_id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:rating, :description, :professor_id, :my_class_id)
    end
end

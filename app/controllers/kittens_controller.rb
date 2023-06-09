class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = 'Kitten created!'
      redirect_to @kitten
    else
      flash[:error] = @kitten.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)

    if @kitten.save
      flash[:success] = 'Kitten updated!'
      redirect_to @kitten
    else
      flash[:error] = @kitten.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash[:success] = 'Kitten deleted!'
      redirect_to kittens_path
    else
      flash[:error] = 'Kitten deletion failed!'
      redirect_to @kitten
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end

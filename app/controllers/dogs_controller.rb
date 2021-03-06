class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @child = Child.find(params[:child_id])
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
    @child = Child.find(params[:child_id])
  end

  # GET /dogs/1/edit
  def edit
    @child = Child.find(params[:child_id])
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)
    @child = Child.find(params[:child_id])
    @dog.child = @child
    respond_to do |format|
      if @dog.save
        format.html { redirect_to child_path(@child), notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    @child = Child.find(params[:child_id])
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to child_path(@child), notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    @child = Child.find(params[:child_id])
    respond_to do |format|
      format.html { redirect_to child_path(@child), notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dog
    @dog = Dog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dog_params
    params.require(:dog).permit(:name, :breed, :child_id)
  end
end

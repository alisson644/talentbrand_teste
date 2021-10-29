class AnnotationsController < ApplicationController
  before_action :set_annotation, only: %i[ show edit update destroy ]

  # GET /annotations or /annotations.json
  def index
    @annotation = Annotation.new
    if params[:q]
      @annotations = Annotation.where(user_id: current_user.id).page(params[:page]).per(3).search_title_or_annotation(params[:q]).order(priority: "desc")
    else
      @annotations = Annotation.where(user_id: current_user.id).page(params[:page]).per(3).order(priority: "desc")
    end
  end

  def search
    @annotations = Annotation.where(user_id: current_user.id).search_title_or_annotation(params[:q])
  end

  # GET /annotations/1 or /annotations/1.json
  def show
    unless @annotation[:user_id] == current_user.id
      redirect_to root_path , alert: "Só pode acessar suas anotaçoes"
    end
  end

  # GET /annotations/new
  def new
    @annotation = Annotation.new
  end

  # GET /annotations/1/edit
  def edit
    unless @annotation[:user_id] == current_user.id
      redirect_to root_path , alert: "Só pode Editar suas anotaçoes"
    end
  end

  # POST /annotations or /annotations.json
  def create
    @annotation = Annotation.new(annotation_params) 
    @annotation.user_id = current_user.id

    respond_to do |format|
      if @annotation.save
        format.html { redirect_to root_path, notice: "Anotação criada com sucesso." }
        format.json { render :show, status: :created, location: @annotation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annotations/1 or /annotations/1.json
  def update
    respond_to do |format|
      if @annotation.update(annotation_params)
        format.html { redirect_to @annotation, notice: "Anotação atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @annotation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annotations/1 or /annotations/1.json
  def destroy
    @annotation.destroy
    respond_to do |format|
      format.html { redirect_to annotations_url, notice: "Anotação foi deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annotation
      @annotation = Annotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def annotation_params
      params.require(:annotation).permit(:title, :annotation, :date, :priority)
    end
end

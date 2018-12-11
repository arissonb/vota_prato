class RestaurantesController < ApplicationController

  def index
    @restaurantes = Restaurante.all.page(params['page']).per(8)
    @comentarios = Comentario.new
    respond_to do |format|
      format.html
      format.xml {render xml: @restaurantes}
      format.json {render json: @restaurantes}
    end
  end

  def new
    @restaurante = Restaurante.new
    @comentarios = Comentario.new
  end

  def create
    @restaurante = Restaurante.new(restaurante_params)
    if @restaurante.save
      redirect_to action: "show", id: @restaurante
    else
      render action: "new"
    end  
    @restaurante.save
  end

  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes(restaurante_params)
      redirect_to action: "show", id: @restaurante
    else
      render action: "edit"
    end
  end

  def edit
    @restaurante = Restaurante.find(params[:id])
  end

  def show
    @restaurante = Restaurante.find(params[:id])
    @comentarios = Comentario.new

    respond_to do |format|
      format.html
      format.json {render json: @restaurante}
      format.xml {render xml: @restaurante}
    end
  end

  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    redirect_to(action: "index")
  end

  private


  def restaurante_params
    params.require(:restaurante).permit(:nome, :endereco, :especialidade, :foto)
  end


end

class CandidatosController < ApplicationController
  before_action :set_candidato, only: %i[ show edit update destroy ]

  # GET /candidatos or /candidatos.json
  def index
    @candidatos = Candidato.all
  end

  # GET /candidatos/1 or /candidatos/1.json
  def show
  end

  # GET /candidatos/new
  def new
    @candidato = Candidato.new
  end

  # GET /candidatos/1/edit
  def edit
  end

  # POST /candidatos or /candidatos.json
  def create
    @candidato = Candidato.new(candidato_params)

    respond_to do |format|
      if @candidato.save
        format.html { redirect_to candidato_url(@candidato), notice: "Candidato cadastrado." }
        format.json { render :show, status: :created, location: @candidato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidatos/1 or /candidatos/1.json
  def update
    respond_to do |format|
      if @candidato.update(candidato_params)
        format.html { redirect_to candidato_url(@candidato), notice: "Informações atualizadas." }
        format.json { render :show, status: :ok, location: @candidato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatos/1 or /candidatos/1.json
  def destroy
    @candidato.destroy

    respond_to do |format|
      format.html { redirect_to candidatos_url, notice: "Candidato exlcuído do sistema." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidato_params
      params.require(:candidato).permit(:nome, :email, :cpf, :dataNascimento, :telefone)
    end
end

class VagasController < ApplicationController
  before_action :set_vaga, only: %i[ show edit update destroy ]

  # GET /vagas or /vagas.json or /empregador/:id/vagas
  def index
    if params[:empregador_id]
      @empregador = Empregador.find(params[:empregador_id])
      @vagas = @empregador.vagas
    else
      @vagas = Vaga.all
    end

  end

  # GET /vagas/1 or /vagas/1.json or /empregador/:id/vagas/1 or /empregador/:id/vagas/1.json
  def show
    if params[:empregador_id]
      @empregador = Empregador.find(params[:empregador_id])
    end
  end

  # GET /empregador/:id/vagas/new
  def new
    @empregador = Empregador.find(params[:empregador_id])
    @vaga = Vaga.new
  end

  # GET /empregador/:id/vagas/1/edit
  def edit
    @empregador = Empregador.find(params[:empregador_id])
  end

  # POST /empregador/:id/vagas or /empregador/:id/vagas.json
  def create
    @empregador = Empregador.find(params[:empregador_id])
    @vaga = @empregador.vagas.build(vaga_params)

    respond_to do |format|
      if @vaga.save
        format.html { redirect_to empregador_vaga_url(@empregador, @vaga), notice: "Vaga adicionada." }
        format.json { render :show, status: :created, location: @vaga }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empregador/:id/vagas/1 or /empregador/:id/vagas/1.json
  def update
    @empregador = Empregador.find(params[:empregador_id])
    respond_to do |format|
      if @vaga.update(vaga_params)
        format.html { redirect_to empregador_vaga_url(@empregador, @vaga), notice: "Vaga atualizada." }
        format.json { render :show, status: :ok, location: @vaga }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empregador/:id/vagas/1 or /empregador/:id/vagas/1.json
  def destroy
    @empregador = Empregador.find(params[:empregador_id])
    @vaga.destroy

    respond_to do |format|
      format.html { redirect_to empregador_vagas_url(@empregador), notice: "Vaga removida." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaga
      @vaga = Vaga.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vaga_params
      params.require(:vaga).permit(:titulo, :descricao, :salario)
    end
end

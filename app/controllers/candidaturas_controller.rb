class CandidaturasController < ApplicationController
  before_action :set_candidatura, only: %i[ show edit update destroy ]

  # GET /candidaturas or /candidaturas.json
  def index
    if params[:empregador_id]
      @empregador = Empregador.find(params[:empregador_id])
      @vaga = Vaga.find(params[:vaga_id])
      @candidaturas = @vaga.candidaturas
    elsif params[:candidato_id]
      @candidato = Candidato.find(params[:candidato_id])
      @candidaturas = @candidato.candidaturas
    else
      @candidaturas = Candidatura.all
    end
  end

  # GET /candidaturas/1 or /candidaturas/1.json
  def show
    if params[:candidato_id]
      @candidato = Candidato.find(params[:candidato_id])
    elsif params[:empregador_id]
      @empregador = Empregador.find(params[:empregador_id])
    end
  end

  # GET /candidaturas/new
  def new
    @candidato = Candidato.find(params[:candidato_id])
    @vaga = Vaga.find(params[:vaga_id])
    @candidatura = Candidatura.new
  end

  # GET /candidaturas/1/edit
  def edit
    @candidato = Candidato.find(params[:candidato_id])
    @candidatura = Candidatura.find(params[:id])
  end

  # POST /candidaturas or /candidaturas.json
  def create
    @candidaturaJaFeita = Candidatura.where('candidato_id = ?', params[:candidato_id]).where('vaga_id = ?', params[:vaga_id])
    @candidato = Candidato.find(params[:candidato_id])
    @vaga = Vaga.find(params[:vaga_id])

    respond_to do |format|
      unless @candidaturaJaFeita.any?
        @candidatura = @candidato.candidaturas.build(mensagem: candidatura_params[:mensagem], vaga_id: @vaga.id)
        if @candidatura.save
          format.html { redirect_to candidato_candidatura_url(@candidato, @candidatura), notice: "Candidatura adicionada." }
          format.json { render :show, status: :created, location: @candidatura }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @candidatura.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to candidato_vaga_new_candidatura_path(@candidato, @vaga), notice: "Você já adicionou uma candidatura para essa vaga." }
      end
    end
  end

  # PATCH/PUT /candidaturas/1 or /candidaturas/1.json
  def update
    @candidato = Candidato.find(params[:candidato_id])
    respond_to do |format|
      if @candidatura.update(candidatura_params)
        format.html { redirect_to candidato_candidatura_url(@candidato, @candidatura), notice: "Candidatura atualizada." }
        format.json { render :show, status: :ok, location: @candidatura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidaturas/1 or /candidaturas/1.json
  def destroy
    @candidato = Candidato.find(params[:candidato_id])
    @candidatura.destroy

    respond_to do |format|
      format.html { redirect_to candidato_candidaturas_url(@candidato), notice: "Candidatura removida." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidatura
      @candidatura = Candidatura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidatura_params
      params.require(:candidatura).permit(:mensagem, :candidato_id, :vaga_id)
    end
end

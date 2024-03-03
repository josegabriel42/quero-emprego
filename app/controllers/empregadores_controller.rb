class EmpregadoresController < ApplicationController
  before_action :set_empregador, only: %i[ show edit update destroy ]

  # GET /empregadores or /empregadores.json
  def index
    @empregadores = Empregador.all
  end

  # GET /empregadores/1 or /empregadores/1.json
  def show
  end

  # GET /empregadores/new
  def new
    @empregador = Empregador.new
  end

  # GET /empregadores/1/edit
  def edit
  end

  # POST /empregadores or /empregadores.json
  def create
    @empregador = Empregador.new(empregador_params)

    respond_to do |format|
      if @empregador.save
        format.html { redirect_to empregador_url(@empregador), notice: "Empregador cadastrado." }
        format.json { render :show, status: :created, location: @empregador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empregador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empregadores/1 or /empregadores/1.json
  def update
    respond_to do |format|
      if @empregador.update(empregador_params)
        format.html { redirect_to empregador_url(@empregador), notice: "Informações atualizadas." }
        format.json { render :show, status: :ok, location: @empregador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empregador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empregadores/1 or /empregadores/1.json
  def destroy
    @empregador.destroy

    respond_to do |format|
      format.html { redirect_to empregadores_url, notice: "Empregador excluído do sistema." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empregador
      @empregador = Empregador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empregador_params
      params.require(:empregador).permit(:nome, :nomeEmpresa, :email, :cnpj, :endereco, :telefone)
    end
end

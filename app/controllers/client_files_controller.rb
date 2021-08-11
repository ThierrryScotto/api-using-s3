class ClientFilesController < ApplicationController
  before_action :set_client_file, only: [:show, :update, :destroy]

  # GET /client_files
  def index
    @client_files = ClientFile.all

    render json: @client_files
  end

  # GET /client_files/1
  def show
    render json: @client_file
  end

  # POST /client_files
  def create
    @client_file = ClientFile.new(client_file_params)

    if @client_file.save
      render json: @client_file, status: :created, location: @client_file
    else
      render json: @client_file.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_files/1
  def update
    if @client_file.update(client_file_params)
      render json: @client_file
    else
      render json: @client_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_files/1
  def destroy
    @client_file.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_file
      @client_file = ClientFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_file_params
      params.require(:client_file).permit(:name, :id_client)
    end
end

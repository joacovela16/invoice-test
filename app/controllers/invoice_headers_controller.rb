class InvoiceHeadersController < ApplicationController
  before_action :set_invoice_header, only: [:show, :edit, :update, :destroy]

  # GET /invoice_headers
  # GET /invoice_headers.json
  def index
    puts DateTime.now()
    @invoice_headers = InvoiceHeader.all
  end

  # GET /invoice_headers/1
  # GET /invoice_headers/1.json
  def show
  end

  # GET /invoice_headers/new
  def new
    @invoice_header = InvoiceHeader.new
  end

  # GET /invoice_headers/1/edit
  def edit
  end

  # POST /invoice_headers
  # POST /invoice_headers.json
  def create
    
    puts invoice_header_params[:client_name]

    @invoice_header = InvoiceHeader.new(invoice_header_params)
    @invoice_header.creation_date = DateTime.now()
    @invoice_header.modification_date = DateTime.now()
    @invoice_header.total = @invoice_header.totalRutine

    respond_to do |format|
      if @invoice_header.save
        format.html { redirect_to @invoice_header, notice: 'Invoice header was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_header }
      else
        format.html { render :new }
        format.json { render json: @invoice_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_headers/1
  # PATCH/PUT /invoice_headers/1.json
  def update
    @invoice_header.modification_date = DateTime.now()
    @invoice_header.total = @invoice_header.totalRutine
    @invoice_header.save()
    
    respond_to do |format|
      if @invoice_header.update(invoice_header_params)
        format.html { redirect_to @invoice_header, notice: 'Invoice header was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_header }
      else
        format.html { render :edit }
        format.json { render json: @invoice_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_headers/1
  # DELETE /invoice_headers/1.json
  def destroy
    @invoice_header.destroy
    respond_to do |format|
      format.html { redirect_to invoice_headers_url, notice: 'Invoice header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_header
      @invoice_header = InvoiceHeader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_header_params
      params.require(:invoice_header).permit(:commit, :client_name, :client_last_name, :doc_id, :email, :phone, :rate, :address)
    end

end

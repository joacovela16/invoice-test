class InvoiceLinesController < ApplicationController
  before_action :set_invoice_line, only: [:show, :edit, :update, :destroy]

  # GET /invoice_lines
  # GET /invoice_lines.json
  def index
    @invoice_lines = InvoiceLine.all
  end

  # GET /invoice_lines/1
  # GET /invoice_lines/1.json
  def show
  end

  # GET /invoice_lines/new
  def new
    @invoice_line = InvoiceLine.new
  end

  # GET /invoice_lines/1/edit
  def edit
  end

  # POST /invoice_lines
  # POST /invoice_lines.json
  def create
    set_header
    tmp = invoice_line_params
    tmp[:invoice_header] = @invoice_header
    @invoice_line = InvoiceLine.new(tmp)
    @invoice_line.creation_date = DateTime.now()
    @invoice_line.modification_date = DateTime.now()
    @invoice_line.total = @invoice_line.quantity * @invoice_line.price

    @invoice_header.total = @invoice_header.totalRutine
    @invoice_header.save()

    respond_to do |format|
      if @invoice_line.save
        format.html { redirect_to @invoice_line, notice: 'Invoice line was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_line }
      else
        format.html { render :new }
        format.json { render json: @invoice_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_lines/1
  # PATCH/PUT /invoice_lines/1.json
  def update
    set_header

    @invoice_line.total = @invoice_line.quantity * @invoice_line.price
    @invoice_header.total = @invoice_header.totalRutine
    @invoice_header.save()

    respond_to do |format|
      if @invoice_line.update(invoice_line_params)
        format.html { redirect_to @invoice_line, notice: 'Invoice line was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_line }
      else
        format.html { render :edit }
        format.json { render json: @invoice_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_lines/1
  # DELETE /invoice_lines/1.json
  def destroy
    @invoice_line.destroy
    respond_to do |format|
      format.html { redirect_to invoice_lines_url, notice: 'Invoice line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_line
      @invoice_line = InvoiceLine.find(params[:id])
    end

    def set_header
      tmp = invoice_line_params
      puts tmp[:invoice_header_id].to_i
      @invoice_header = InvoiceHeader.find(tmp[:invoice_header_id].to_i)
    end

    # Only allow a list of trusted parameters through.
    def invoice_line_params
      params.require(:invoice_line).permit(:invoice_line, :description, :invoice_header, :invoice_header_id,:commit, :product_name, :quantity, :price, :invoice_header)
    end
end

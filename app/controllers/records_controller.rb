class RecordsController < ApplicationController
  before_filter :authenticate_user!
  # GET /records
  # GET /records.json
  def index
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @records = Record.where(:recording_sheet_id => @recording_sheet)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @record = Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @record = Record.new(params[:record])
    @record.recording_sheet_id = @recording_sheet.id

    respond_to do |format|
      if @record.save
        format.html { redirect_to recording_sheet_record_path(@recording_sheet, @record), notice: 'Record was successfully created.' }
        format.json { render json: @record, status: :created, location: recording_sheet_record_path(@recording_sheet, @record) }
      else
        format.html { render action: "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @record = Record.find(params[:id])

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to recording_sheet_record_path(@recording_sheet, @record), notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @recording_sheet = RecordingSheet.find(params[:recording_sheet_id])
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to recording_sheet_records_path(@recording_sheet) }
      format.json { head :no_content }
    end
  end
end

class RecordingSheetsController < ApplicationController
  # GET /recording_sheets
  # GET /recording_sheets.json
  def index
    @recording_sheets = RecordingSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recording_sheets }
    end
  end

  # GET /recording_sheets/1
  # GET /recording_sheets/1.json
  def show
    @recording_sheet = RecordingSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recording_sheet }
    end
  end

  # GET /recording_sheets/new
  # GET /recording_sheets/new.json
  def new
    @recording_sheet = RecordingSheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recording_sheet }
    end
  end

  # GET /recording_sheets/1/edit
  def edit
    @recording_sheet = RecordingSheet.find(params[:id])
  end

  # POST /recording_sheets
  # POST /recording_sheets.json
  def create
    @recording_sheet = RecordingSheet.new(params[:recording_sheet])
    @recording_sheet.observer_id = current_user.id

    respond_to do |format|
      if @recording_sheet.save
        format.html { redirect_to @recording_sheet, notice: 'Recording sheet was successfully created.' }
        format.json { render json: @recording_sheet, status: :created, location: @recording_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @recording_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recording_sheets/1
  # PUT /recording_sheets/1.json
  def update
    @recording_sheet = RecordingSheet.find(params[:id])

    respond_to do |format|
      if @recording_sheet.update_attributes(params[:recording_sheet])
        format.html { redirect_to @recording_sheet, notice: 'Recording sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recording_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recording_sheets/1
  # DELETE /recording_sheets/1.json
  def destroy
    @recording_sheet = RecordingSheet.find(params[:id])
    @recording_sheet.destroy

    respond_to do |format|
      format.html { redirect_to recording_sheets_url }
      format.json { head :no_content }
    end
  end
end

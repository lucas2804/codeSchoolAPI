class Admin::TestsController < Admin::ApplicationController
  before_action :set_admin_test, only: [:show, :edit, :update, :destroy]

  # GET /admin/tests
  # GET /admin/tests.json
  def index
    @admin_tests = ::Test.all
  end

  # GET /admin/tests/1
  # GET /admin/tests/1.json
  def show
  end

  # GET /admin/tests/new
  def new
    @admin_test = ::Test.new
  end

  # GET /admin/tests/1/edit
  def edit
  end

  # POST /admin/tests
  # POST /admin/tests.json
  def create
    @admin_test = ::Test.new(admin_test_params)

    respond_to do |format|
      if @admin_test.save
        format.html { redirect_to [:admin, @admin_test], notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @admin_test] }
      else
        format.html { render :new }
        format.json { render json: @admin_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tests/1
  # PATCH/PUT /admin/tests/1.json
  def update
    respond_to do |format|
      if @admin_test.update(admin_test_params)
        format.html { redirect_to [:admin, @admin_test], notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @admin_test] }
      else
        format.html { render :edit }
        format.json { render json: @admin_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tests/1
  # DELETE /admin/tests/1.json
  def destroy
    @admin_test.destroy
    respond_to do |format|
      format.html { redirect_to admin_tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_test
      @admin_test = ::Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_test_params
      params.require(:test).permit(:name, :description, :id)
    end
end

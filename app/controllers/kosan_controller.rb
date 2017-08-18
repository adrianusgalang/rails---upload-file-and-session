class KosanController < ApplicationController
  def show
    @session_user = "0"
    if session[:current_user_id] == "111222111222"
      @session_user = "1"
    end
    @kosan = Kosan.find(params[:id])
  end

  def update
    if session[:current_user_id] == "111222111222"
      @kosan = Kosan.find(params[:id])
      @kosan.update(kosan_params)
      redirect_to @kosan
    else
      redirect_to action: :index
    end
  end

  def edit
    @session_user = "0"
    if session[:current_user_id] == "111222111222"
      @session_user = "1"
    end
    if session[:current_user_id] == "111222111222"
      @kosan = Kosan.find(params[:id])
    else
      redirect_to action: :index
    end
  end

  def index
    @session_user = "0"
    if session[:current_user_id] == "111222111222"
      @session_user = "1"
    end

    @kosans = Kosan.all
  end

  def new
    if session[:current_user_id] == "111222111222"
    else
      redirect_to url_for(:controller => :home, :action => :index)
    end
  end

  def create
    uploaded_io = params[:kos][:gambar]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    @kosan = Kosan.new(kosan_params) do |t|
      if params[:kos][:gambar]
        t.gambar  = params[:kos][:gambar].original_filename
      end
    end

  #  @kosan = Kosan.new(kosan_params)
    @kosan.save
    redirect_to @kosan
  end

  def destroy
    if session[:current_user_id] == "111222111222"
      @kosan = Kosan.find(params[:id])
      @kosan.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private
    def kosan_params
      params.require(:kos).permit(:nama, :lokasi, :deskripsi, :harga, :gambar, :kontak)
    end
end

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show, :index], unique: [:session_hash]
  
  # GET /books
  # GET /books.json
  def index
    if user_signed_in?
      @books = Book.all.paginate(:page => params[:page], per_page: 6).order("id desc")
    else
      redirect_to '/users/sign_in'
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    impressionist(@book)
  end



  # GET /books/new
  def new
    @book = Book.new
  end



  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    uploader = ImageUploader.new  # 새로운 머신 업로더를 생성하고
    uploader.store!(params[:pic]) # 받아온 이미지를 저장하고 
    @book.image_url = uploader.url # 그 url 값을 @book.imgage_url에 저장한다
  
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: '글을 성공적으로 작성하였습니다' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: '글이 수정되었습니다' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: '글이 삭제되었습니다' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :content, :price)
    end
  
end

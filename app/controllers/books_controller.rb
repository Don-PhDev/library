class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_book, only: %i[ show edit update destroy library]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def library
    type = params[:type]

    if type == "add"
      current_user.library_additions << @book
      redirect_to libraries_path,
        notice: "#{@book} was successfully added to your library"
    elsif type == "remove"
      current_user.library_additions.delete(@book)
      redirect_to root_path,
        notice: "#{@book} was successfully removed from your library"
    else
      redirect_to book_path(@book),
        notice: "Looks like nothing happened. Try once more!"
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :description, :author, :user_id)
    end
end

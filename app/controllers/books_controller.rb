class BooksController < ApplicationController
 
    
    def create #ボタンを押したあとの動き
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book.id)
        else
            flash[:notice] = "Failed to post."
            @books = Book.all
            render :index
        end 
    end    
    
    def index
        @books = Book.all
        @book = Book.new #空のインスタ
    end 
    
    def show
        @books =Book.find(params[:id])
    end 
    
    
    def edit
        @books = Book.find(params[:id])
    end 
    
    def update
        @books = Book.find(params[:id])
        if @books.update(book_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to book_path(@books.id)
        else
            flash[:notice] = "Failed to post."
            render :edit
        end 
    end
    
    def destroy
        book = Book.find(params[:id])#データ１件取得
        book.destroy #削除する
        redirect_to '/books' #戻るページ
    end
    
    
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end 
    
end 


class PortfoliosController < ApplicationController
def index
@portfolio_item=Portfolio.all
end
def new
@portfolio_item=Portfolio.new
end

## set the  create  method and set the params --AB
 def create
    @portfolio_item=Portfolio.new( params.require(:portfolio).permit(:title,:subtitile, :body ))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item is live &  successfully created.' }
             format.json { render :show, status: :created, location: @portfolio_item}
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }

      end
    end
  end

def edit
 @portfolio_item=Portfolio.find(params[:id])
    end

## create updating method and set the params --AB
def update

     @portfolio_item=Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title,:subtitile, :body ))
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

def show
 @portfolio_item=Portfolio.find(params[:id])
end
def destroy
  ##This is perform the look up
 @portfolio_item=Portfolio.find(params[:id])
  ##destroy and delete record
   @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end

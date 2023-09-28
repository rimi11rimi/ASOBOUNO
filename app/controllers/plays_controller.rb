class PlaysController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def gohan
    @plays = Play.all
  end

  def moll
    @plays = Play.all
  end

 def sport
    @plays = Play.all
  end

  def activity
    @plays = Play.all
  end

  def view
    @plays = Play.all
  end

  def sizenn
    @plays = Play.all
  end

  def top
    @plays = Play.all
  end

  def all
    @plays = Play.all
  end




  def index
    @plays= Play.all
    @tags = Tag.all
    @plays = @plays.where("title LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    
    if params[:tag_ids].present?
      play_ids = []
      params[:tag_ids].each do |key, value| 
        if value == "1"
          Tag.find_by(name: key).plays.each do |p| 
            play_ids << p.id
          end
        end
      end
      play_ids = play_ids.uniq
      #キーワードとタグのAND検索
      @plays = @plays.where(id: play_ids) if play_ids.present?
    end
  end
  

      def new
        @play = Play.new
      end
    
      def create
        play = Play.new(play_params)

        play.user_id = current_user.id
        if play.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @play = Play.find(params[:id])
        @comments = @play.comments
        @comment = Comment.new
      end

      def edit
        @play = Play.find(params[:id])
      end

      def update
        play = Play.find(params[:id])
        if play.update(play_params)
          redirect_to :action => "show", :id => play.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        play = Play.find(params[:id])
        play.destroy
        redirect_to action: :index
      end
    
      private
      def play_params
        params.require(:play).permit(:title,:body,:scene,:time,:price,:address, :image,:category,tag_ids: [])
      end
end



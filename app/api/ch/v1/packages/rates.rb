module CH
  module V1
    class Packages::Rates < Grape::API
      before do
        authenticate!
        @package = Package.find(params[:id])
      end

      desc 'Update Rating'
      params do
        requires :rating_id,  type: String,  desc: 'rating id'
        requires :version_id, type: String,  desc: 'package version id'
        requires :rating,     type: Integer, desc: 'rating'
        optional :title,      type: String,  desc: 'comment title'
        optional :comment,    type: String,  desc: 'comment text'
      end
      put :rate, rabl: 'packages/show' do

        version = @package.latest_version

        rating = Rating.find(params[:rating_id])

        comment_text = params[:comment]
        comment_title = params[:title]

        #if its the same version just update the comments and the score
        if rating.version.id.eql?(version.id)
          rating.update!(score: params[:rating])  unless !params[:rating]
          if comment_text
            if rating.comment
              rating.comment.update(text: comment_text, title: comment_title)
              rating.save!
            else
              comment = Comment.create(text: comment_text, title: comment_title)
              rating.comment = comment
              rating.save!
            end
          end
          #if its a different version then go ahead and crate the rating for the new version
        else
          rating = current_user.ratings.create!(score: params[:rating], version_id: version.id)
          if comment_text
            comment = Comment.create(text: comment_text, title: comment_title)
            rating.comment = comment
            rating.save!
          end
        end
        rating.version.package
      end

      desc 'Add Rating To Latest Version of Package'
      params do
        requires :version_id, type: String,  desc: 'package version id'
        requires :rating,     type: Integer, desc: 'rating'
        optional :comment,    type: String,  desc: 'comment text'
        optional :title,      type: String,  desc: 'comment title'
      end
      post :rate, rabl: 'packages/show' do
        version_id    = params[:version_id]
        comment_text  = params[:comment]
        comment_title = params[:title]
        rating_score  = params[:rating]

        rating = current_user.ratings.create!(score: rating_score, version_id: version_id)
        if comment_text
          comment = Comment.create!(text: comment_text, title: comment_title)
          rating.comment = comment
          rating.save!
        end
        @package
      end
    end
  end
end
class Functions

  def AddOrUpdate(s)

    tvdb = TvdbParty::Search.new("A0FB32A47B288FA2")
    show = tvdb.search(s)
    series = tvdb.get_series_by_id(show.first["seriesid"])
    actors = tvdb.get_actors(series)
    episodes = tvdb.get_all_episodes(series, "en")
    banners = tvdb.get_banners(series)
    seasons = tvdb.get_seasons(series, "en")

    @show_tvdb = {
      id: series.id.to_i,
      name: series.name,
      overview: series.overview,
      first_aired: series.first_aired,
      genres: series.genres.join(", "),
      network: series.network,
      rating: series.rating.to_i,
      runtime: series.runtime,
      air_time: series.air_time,
      imdb_id: series.imdb_id,
      episodes_count: episodes.length,
      actors_count: actors.length,
      seasons_count: seasons.length,
      status: series.status,
      airs_dayofweek: series.airs_dayofweek,
      rating_count: series.ratingcount.to_i
    }

    if !Show.find_by_id(series.id.to_i)
      Show.create(@show_tvdb)
    elsif Show.find(series.id.to_i) != @show_tvdb
      Show.find(series.id.to_i).update(@show_tvdb)
    end

    actors.each do |actor|
      if actor.image.present?
        @img = Cloudinary::Uploader.upload("http://thetvdb.com/banners/" + actor.image, :public_id => 'actors/' + actor.id, :unique_filename => false)
      else
        @img = Cloudinary::Uploader.upload("http://placehold.it/300x450", :public_id => 'actors/placeholder' , :unique_filename => false)  
      end
      @act_tvdb = {
        id: actor.id.to_i,
        name: actor.name,
        role: actor.role,
        image: @img["url"],
        show_id: series.id.to_i,
        sort_order: actor.sortorder.to_i
      }

      if !Actor.find_by_id(actor.id.to_i)
        Actor.create(@act_tvdb)
      elsif Actor.find(actor.id.to_i) != @act_tvdb
        Actor.find(actor.id.to_i).update(@act_tvdb)
      end
    end
      
    episodes.each do |episode|
      if episode.thumb.present?
        @img = Cloudinary::Uploader.upload(episode.thumb, :public_id => 'episodes/' + series.id + '/' + episode.id, :unique_filename => false)
      else
        @img = Cloudinary::Uploader.upload("http://placehold.it/400x225", :public_id => 'episodes/placeholder' , :unique_filename => false)  
      end
      @epi_tvdb = {
        id: episode.id.to_i,
        season_number: episode.season_number.to_i,
        number: episode.number.to_i,
        name: episode.name,
        overview: episode.overview,
        air_date: episode.air_date.to_s,
        thumb: @img["url"],
        guest_stars: episode.guest_stars.join(", "),
        director: episode.director,
        writer: episode.writer,
        show_id: series.id.to_i,
        rating: episode.rating.to_i,
        rating_count: episode.ratingcount.to_i
      }
      if !Episode.find_by_id(episode.id.to_i)
        Episode.create(@epi_tvdb)
      elsif Episode.where(episode.id.to_i) != @epi_tvdb
        Episode.find(episode.id.to_i).update(@epi_tvdb)
      end
    end

    banners.each do |banner|
      @img = Cloudinary::Uploader.upload("http://thetvdb.com/banners/" + banner.path, :public_id => banner.path.slice(0..-5), :unique_filename => false)
      Banner.find_or_create_by(
        banner_type: banner.banner_type,
        banner_type2: banner.banner_type2,
        season: banner.season,
        image_path: @img["url"],
        language: banner.language,
        show_id: series.id.to_i
      )
    end

  end
end




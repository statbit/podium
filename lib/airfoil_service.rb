class AirfoilService

  attr_accessor :source

  SOURCE_TO_APP_LOCATION = {
    spotify: '/Applications/Spotify.app',
    itunes: '/Applications/iTunes.app'
  }

  def initialize(options)
    @source = options[:source]
    @speaker_set = options[:speakers]
  end

  def make_it_so
    make_it_so_source
    make_it_so_speakers
  end

private

  def make_it_so_source
    AsRunner.new(itunes_pause_script).run
    AsRunner.new(spotify_pause_script).run

    case @source
    when :itunes
      AsRunner.new(itunes_play_script).run
    when :spotify
      AsRunner.new(spotify_play_script).run
    end

    AsRunner.new(source_script, SOURCE_TO_APP_LOCATION[@source]).run
  end

  def make_it_so_speakers
    AsRunner.new(all_off_script).run
    sleep 1
    AsRunner.new(speaker_script, enabled_speakers).run
  end

  def enabled_speakers
    if @speaker_set == :some
      speaker_list.select do |name|
        !name.downcase.include?('apple tv')
      end
    else
      speaker_list
    end
  end

  def speaker_list
    list = AsRunner.new(speaker_list_script).run
    list.split(',').select do |name|
      !name.blank? && !name.downcase.include?('repeater')
    end.map(&:strip)
  end

  def speaker_list_script
    Rails.root.join('applescript/get_speakers.scpt')
  end

  def source_script
    Rails.root.join('applescript/set_app_source.scpt')
  end

  def all_off_script
    Rails.root.join('applescript/turn_off_all_speakers.scpt')
  end

  def speaker_script
    Rails.root.join('applescript/set_speakers.scpt')
  end

  def itunes_play_script
    Rails.root.join('applescript/itunes_play.scpt')
  end

  def itunes_pause_script
    Rails.root.join('applescript/itunes_pause.scpt')
  end

  def spotify_play_script
    Rails.root.join('applescript/spotify_play.scpt')
  end

  def spotify_pause_script
    Rails.root.join('applescript/spotify_pause.scpt')
  end
end

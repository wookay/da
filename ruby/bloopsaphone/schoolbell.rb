require 'rubygems'
require 'bloops'


def play_song composition
  en = Hash[*"라시도레미파솔".unpack('U*').zip(Array("A".."G")).flatten]
  song = composition.unpack('U*').map{|u|en[u] or [u].pack('U')}.join
  b = Bloops.new
  b.tempo = 160
  b.tune b.sound(Bloops::SQUARE), song
  b.play
  sleep 1 while not b.stopped?
end

play_song "솔솔라라솔솔미 솔솔미미레 솔솔라라솔솔미 솔미레미도"

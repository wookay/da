# test_save_layers
#                           wookay.noh at gmail.com

require 'photoshop'

doc = photoshop.current_document
prefix = doc.name.get

hide_layers doc.layers.get
doc.layer_sets.get.each do |layer_set|
  hide_layers layer_set.layers.get
end

save_layers doc.art_layers.get, prefix
doc.layer_sets.get.each do |layer_set|
  layer_set.visible.set true
  save_layers layer_set.layers.get, prefix
  layer_set.visible.set false
end

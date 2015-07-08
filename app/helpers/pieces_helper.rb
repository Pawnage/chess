module PiecesHelper
  def render_piece(piece, selected_piece=nil)
    classes = selected_piece ? ['img-responsive', 'selected'] : ['img-responsive']
    image_tag "#{piece.color.downcase}-#{piece.type.downcase}.svg", :class => classes.join(' '), data: { piece: piece.id }
  end
end

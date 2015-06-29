module PiecesHelper
  def render_piece(piece, opts = {})
    classes = [opts[:class]]
    classes << 'selected' if piece.selected
    image_tag "#{piece.color.downcase}-#{piece.type.downcase}.svg", :class => classes.join(' ')
  end
end

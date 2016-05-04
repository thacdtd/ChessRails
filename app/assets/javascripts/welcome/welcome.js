var Welcome = (function($) {
  return {
    initialize : function() {
		var chessboard = ChessBoard('chessboard', {
		  draggable: true,
		  dropOffBoard: 'trash',
		  sparePieces: true
		});
	}
  };
})(jQuery);

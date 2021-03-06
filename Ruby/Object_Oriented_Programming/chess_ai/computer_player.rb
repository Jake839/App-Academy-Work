require_relative 'player'
require 'byebug'

class ComputerPlayer < Player 

    attr_reader :at_start, :board, :captured_piece, :pieces_with_valid_moves, :player_positions, :pieces_with_valid_moves_including_a_player_position

    def initialize(name, color, board)
        super(name, color)
        @board = board 
        @at_start = true 
    end 

    def move
        reset_data 
        get_pieces_with_valid_moves
        get_player_positions 
        get_pieces_with_valid_moves_including_a_player_position

        if pieces_with_valid_moves_including_a_player_position.empty? 
           piece, end_pos = random_move 
        else 
           piece, end_pos = take_player_piece_move
        end 

        start_pos = piece.position 
        make_move(piece, start_pos, end_pos) 
    end 

    private 

    def reset_data
        @pieces_with_valid_moves = []
        @player_positions = []
        @captured_piece = nil 
        @at_start = false 
    end 

    def get_player_positions 
        board.rows.each do |row| 
            row.each { |piece| @player_positions << piece.position if color == piece.opponent_color } 
        end 
    end 

    def get_pieces_with_valid_moves
        board.rows.each do |row|
            row.each { |piece| @pieces_with_valid_moves << piece if piece.color == color && !piece.valid_moves.empty? } 
        end 
    end 

    def add_valid_moves_with_player_positions(piece)
        piece.valid_moves.each { |move| @pieces_with_valid_moves_including_a_player_position[piece] << move if player_positions.include?(move) } 
    end 

    def reset_pieces_with_valid_moves_including_a_player_position
        @pieces_with_valid_moves_including_a_player_position = Hash.new { |hash, key| hash[key] = [] }
    end 

    def get_pieces_with_valid_moves_including_a_player_position
        reset_pieces_with_valid_moves_including_a_player_position
        pieces_with_valid_moves.each { |piece| add_valid_moves_with_player_positions(piece) } 
    end 

    def random_move
        piece = pieces_with_valid_moves.sample 
        end_pos = piece.valid_moves.sample 
        [piece, end_pos]
    end 

    def take_player_piece_move
        piece = pieces_with_valid_moves_including_a_player_position.keys.sample 
        end_pos = pieces_with_valid_moves_including_a_player_position[piece].sample 
        [piece, end_pos]
    end 

    def mark_captured_piece(piece, end_pos)
        @captured_piece = board[end_pos.first, end_pos.last].class if piece.opponent_color == board[end_pos.first, end_pos.last].color
    end 

    def make_move(piece, start_pos, end_pos)
        mark_captured_piece(piece, end_pos)
        board.move_piece(start_pos, end_pos)
        [piece.class, start_pos, end_pos, captured_piece]
    end 

end 
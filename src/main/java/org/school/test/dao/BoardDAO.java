package org.school.test.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import org.school.test.vo.Board;
import org.school.test.vo.User;
import org.school.test.vo.goodHit;

public interface BoardDAO {

	public void insertBoard(Board board);

	public List<Board> getBoardList();

	public Board getBoard(String boardnum);

	public void hitBoardCount(Board b);

	public void updateBoard(Board b);

	public void deleteBoard(String boardnum);

	public void insertHitGood(goodHit g);

	public int getHitGood(String boardnum);

	public goodHit selectOneGoodHit(goodHit goodHit);

	public int getCount(Map<String, String> map);

	public List<Board> getBoardListMap(Map<String, String> map, RowBounds rb);

	


}
